//
//  GameManager.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-09.
//

import Foundation


final class GameManager: ObservableObject{
    static let shared = GameManager() //singleton
    
    @Published var overlay: Constants.ScreenType?
    
        //-MARK: Notes for Shannon
        //these are the two objects you will need
//        DatabaseManager.shared.map
//        DatabaseManager.shared.user
        
        //if you change them, you have to save them to the DB using these fucntions
//        DatabaseManager.shared.saveMap()
//        DatabaseManager.shared.saveUser()
        
        //syntax is very basic but I will leave this here. ask me for help otherwise
        //https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/
    
    
    func SetUpGame(){
        
        
    }
}
