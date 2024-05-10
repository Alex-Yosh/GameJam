//
//  GameManager.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-09.
//

import Foundation


final class GameManager: ObservableObject{
    static let shared = GameManager() //singleton
    
    @Published var requiredTaps: Int = 0
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
//    func FlipTile(tile: Tile) {
//       if (!tile.isPressed)
//       {
//           tile.isPressed = true
//           updateScore()
//           DatabaseManager.shared.saveMap()
//       }
//    }
    
//    // add to currScore
//    func updateScore(score: Int32)
//    {
//        DatabaseManager.shared.user.currScore += score
//        if (DatabaseManager.shared.user.currScore > DatabaseManager.shared.user.highScore) {
//        {
//            DatabaseManager.shared.user.highScore = DatabaseManager.shared.user.currScore
//            DatabaseManager.shared.saveUser()
//            
//        }
//       
//    }
//    
//  
//    
//    func StartLevel() {
//        // flips over all cards
//        DatabaseManager.shared.map.forEach((tile) => tile.isPressed = false));
//        DatabaseManager.shared.saveMap();
//        
//    }
//    
//    // show map of the next day
//    func WinLevel() {
//        if (DatabaseManager.shared.user.day < 7) {
//            DatabaseManager.shared.user.day += 1
//        }
//        else {
//            RestartGame();
//        }
//        
//        // move on to next day (need to add bombs)
//        DatabaseManager.shared.map.forEach()
//        
//        
//        
//        
//    }
//    
//
//    // call this when failing a level and reset back to day 1
//    func RestartGame(){
//        DatabaseManager.shared.map = [][];
//        // initialize 6 by 6 grid with 4 bombs at random locations
//        DatabaseManager.shared.map.append(<#T##newElement: [Tile]##[Tile]#>)
//        
//    }
}
