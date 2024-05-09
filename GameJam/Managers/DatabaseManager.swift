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
    @Published var user: UserEntity?
    @Published var map: [[TileEntity]] = []
    
    //containers
    let userContainer: NSPersistentContainer
    let mapContainer: NSPersistentContainer
    
    init() {
        //initalize containers
        userContainer = NSPersistentContainer(name: "UserContainer")
        mapContainer = NSPersistentContainer(name: "MapContainer")

        loadContainers()
    }
    
    //-MARK: private helpers
    
    private func loadContainers(){
        userContainer.loadPersistentStores(completionHandler: {_,_ in self.fetchUser()})
        mapContainer.loadPersistentStores(completionHandler: {_,_ in self.fetchMap()})

    }
    
    private func initalizeUser() {
        let newUser = UserEntity(context: userContainer.viewContext)
        newUser.currScore = 0
        newUser.day = 1
        newUser.highScore = 0
        saveUserData()
    }
    
    private func initalizeMap() {
        for _ in 1...Constants.numOfTilesInColumn{
            for _ in 1...Constants.numOfTilesInRow{
                let newTile = TileEntity(context: mapContainer.viewContext)
                newTile.value = 0
                newTile.image = ""
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
            var tempRow: [TileEntity] = []
            var indexIncr = 0
            if (!recievedMap.isEmpty){
                map = []
                for _ in 0...Constants.numOfTilesInColumn-1{
                    for _ in 0...Constants.numOfTilesInRow-1{
                        tempRow.append(recievedMap[indexIncr])
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
                user = tempUser[0]
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
