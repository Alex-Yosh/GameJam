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
    @Published var startedLevel: Bool = false
    
        //-MARK: Notes for Shannon
        //these are the two objects you will need
//        DatabaseManager.shared.map
//        DatabaseManager.shared.user
        
        //if you change them, you have to save them to the DB using these fucntions
//        DatabaseManager.shared.saveMap()
//        DatabaseManager.shared.saveUser()
        
        //syntax is very basic but I will leave this here. ask me for help otherwise
        //https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/
    func FlipTile(row: Int, col: Int) {
        DatabaseManager.shared.map[col][row].isPressed = true
        if (DatabaseManager.shared.map[col][row].value != 0){
            //fish
            updateScore(score: DatabaseManager.shared.map[col][row].value)
            if (requiredTaps > 0)
            {
                requiredTaps-=1
                if (requiredTaps == 0)
                {
                    // TODO: reveal finish button
                }
            }
            
        }
        else{
            //bomb
            //TODO: display popup you lose and transition to RestartGame()
            RestartGame()
        }
        DatabaseManager.shared.saveMap()
    }
    
    // add to currScore
    func updateScore(score: Int32)
    {
        DatabaseManager.shared.user.currScore += score
        if (DatabaseManager.shared.user.currScore > DatabaseManager.shared.user.highScore){
            DatabaseManager.shared.user.highScore = DatabaseManager.shared.user.currScore
        }
        
        DatabaseManager.shared.saveUser()
    }
   
    func StartLevel() {
        requiredTaps = 3
        startedLevel = true
        DatabaseManager.shared.user.day += 1
        
        // flips over all cards and increase the value
        for i in 0...Constants.numOfTilesInColumn-1{
            for j in 0...Constants.numOfTilesInRow-1{
                DatabaseManager.shared.map[i][j].value *= 2
                DatabaseManager.shared.map[i][j].isPressed = false
            }
        }
        DatabaseManager.shared.saveMap()
    }
    
    // show map of the next day
    func WinLevel() {
        if (DatabaseManager.shared.user.day < 7) {
           
           
            AddBombs()
            // TODO: reveal next days bombs for a period of time
            StartLevel()
        }
        else {
            // TODO: display you win popup
            RestartGame();
        }
        DatabaseManager.shared.saveUser()
    }

    // adds 4 new bombs
    func AddBombs() {
        var numBombs = 0
        let totalBombs = 4
        while (numBombs < totalBombs) {
            let randomRow = Int.random(in: 0..<6)
            let randomCol = Int.random(in: 0..<6)
            if (DatabaseManager.shared.map[randomRow][randomCol].value > 0) {
                DatabaseManager.shared.map[randomRow][randomCol].value = 0
                numBombs += 1
            }
        }
        DatabaseManager.shared.saveMap()
    }
    
    // call this when failing a level and reset back to day 1
    func RestartGame(){
        //reinitalize map
        DatabaseManager.shared.reInitalizeMap();
        AddBombs()
        // set up user
        DatabaseManager.shared.user.currScore = 0
        DatabaseManager.shared.user.day = 1
        
        //TODO: add transition/popup before calling startlevel
        StartLevel()
        
    }
}
