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
    
    //containers
    let userContainer: NSPersistentContainer
    
    init() {
        //initalize containers
        userContainer = NSPersistentContainer(name: "UserContainer")

        loadContainers()
    }
    
    
    func loadContainers(){
        userContainer.loadPersistentStores(completionHandler: {_,_ in self.fetchUser()})
    }
    
    func initalizeUser() {
        let newUser = UserEntity(context: userContainer.viewContext)
        newUser.currScore = 0
        newUser.day = 1
        newUser.highScore = 0
        saveUserData()
    }
    
    //private helpers
    
    func fetchUser(){
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
    
    private func saveUserData(){
        do {
            try userContainer.viewContext.save()
            fetchUser()
        } catch let error{
            print("Error saving. \(error)")
        }
    }
}
