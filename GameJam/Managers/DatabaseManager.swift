//
//  DatabaseManager.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-09.
//

import Foundation
import CoreData


final class DatabaseManager: ObservableObject{
    static let shared = DatabaseManager() //singleton
    
    //Databases
    @Published var user: User = User(currScore: 0, day: 0, endDate: Date.now, highScore: 0)
    @Published var map: [[Tile]] = []
    
    //containers
    private let userContainer: NSPersistentContainer
    private let mapContainer: NSPersistentContainer
    
    init() {
        //initalize containers
        userContainer = NSPersistentContainer(name: "UserContainer")
        mapContainer = NSPersistentContainer(name: "MapContainer")
        
        loadContainers()
    }
    
    
    func saveMap() {
        deleteMapData()
        for i in 0...Constants.numOfTilesInColumn-1{
            for j in 0...Constants.numOfTilesInRow-1{
                let newTile = TileEntity(context: mapContainer.viewContext)
                newTile.row = Int32(j)
                newTile.col = Int32(i)
                newTile.value = map[i][j].value
                newTile.imageBack = map[i][j].imageBack
                newTile.imageFront = map[i][j].imageFront
                newTile.isPressed = map[i][j].isPressed
            }
            
        }
        saveMapData()
    }
    
    func reInitalizeMap() {
        deleteMapData()
        initalizeMap()
    }
    
    func saveUser() {
        deleteUserData()
        
        let newUser = UserEntity(context: userContainer.viewContext)
        newUser.currScore = Int32(user.currScore)
        newUser.day = Int32(user.day)
        newUser.endDate = user.endDate
        newUser.highScore = Int32(user.highScore)
        
        saveUserData()
    }
    
    //-MARK: private helpers
    
    func deleteMapData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TileEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do{
            try mapContainer.viewContext.execute(deleteRequest)
        } catch let error{
            print("Error deleting. \(error)")
        }
    }
    
    func deleteUserData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "UserEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do{
            try userContainer.viewContext.execute(deleteRequest)
        } catch let error{
            print("Error deleting. \(error)")
        }
    }
    
    private func loadContainers(){
        userContainer.loadPersistentStores(completionHandler: {_,_ in self.fetchUser()})
        mapContainer.loadPersistentStores(completionHandler: {_,_ in self.fetchMap()})
        
    }
    
    private func initalizeUser() {
        let newUser = UserEntity(context: userContainer.viewContext)
        newUser.currScore = 0
        newUser.day = 1
        newUser.endDate = Date.now
        newUser.highScore = 0
        saveUserData()
    }
    
    private func initalizeMap() {
        for i in 0...Constants.numOfTilesInColumn-1{
            for j in 0...Constants.numOfTilesInRow-1{
                let newTile = TileEntity(context: mapContainer.viewContext)
                newTile.value = 1
                newTile.imageBack = ""
                newTile.imageFront = ""
                newTile.row = Int32(j)
                newTile.col = Int32(i)
                newTile.isPressed = false
            }
        }
        saveMapData()
    }
    
    //save to published variables
    private func fetchMap(){
        let request = NSFetchRequest<TileEntity>(entityName: "TileEntity")
        
        do {
            let recievedMap: [TileEntity] = try mapContainer.viewContext.fetch(request)
            var tempRow: [Tile] = []
            var indexIncr = 0
            if (!recievedMap.isEmpty){
                map = []
                for i in 0...Constants.numOfTilesInColumn-1{
                    for j in 0...Constants.numOfTilesInRow-1{
                        let wantedIdentity = recievedMap.first(where: {$0.row == Int(j) && $0.col == Int(i)})
                        tempRow.append(Tile(imageFront: wantedIdentity?.imageFront ?? "", imageBack: wantedIdentity?.imageBack ?? "", isPressed: wantedIdentity?.isPressed ?? false, value: wantedIdentity?.value ?? Int32(0)))
                        indexIncr+=1
                    }
                    map.append(tempRow)
                    tempRow = []
                }
            }else{
                initalizeMap()
            }
        } catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    private func fetchUser(){
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        
        do {
            let tempUser: [UserEntity] = try userContainer.viewContext.fetch(request)
            if (!tempUser.isEmpty){
                //only one user
                user = User(currScore: tempUser[0].currScore, day: tempUser[0].day, endDate: tempUser[0].endDate!, highScore: tempUser[0].highScore)
            }else{
                initalizeUser()
            }
        } catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    //save data
    private func saveUserData(){
        do {
            try userContainer.viewContext.save()
            fetchUser()
        } catch let error{
            print("Error saving. \(error)")
        }
    }
    
    private func saveMapData(){
        do {
            try mapContainer.viewContext.save()
            fetchMap()
        } catch let error{
            print("Error saving. \(error)")
        }
    }
}
