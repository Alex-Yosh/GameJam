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
    var bombPlacementsRow: [Int] = []
    var bombPlacementsCol: [Int] = []
    
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
            SoundManager.shared.playFishSound()
            if (requiredTaps > 0)
            {
                requiredTaps-=1
            }
            
        }
        else{
            //bomb
            overlay = .basic
            SoundManager.shared.playBombSound()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.overlay = .restart
            }
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
   
    func StartLevel(skipAddDay: Bool) {
        if (DatabaseManager.shared.user.day==0){
            AddBombs()
            ShowBombs(startGame: true)
        }else{
            if (!skipAddDay){
                DatabaseManager.shared.user.day += 1
                
            }
            requiredTaps = 3
            startedLevel = true
            // flips over all cards and increase the value
            for i in 0...Constants.numOfTilesInColumn-1{
                for j in 0...Constants.numOfTilesInRow-1{
                    DatabaseManager.shared.map[i][j].value *= 2
                    DatabaseManager.shared.map[i][j].isPressed = false
                }
            }
            DatabaseManager.shared.saveMap()
            DatabaseManager.shared.saveUser()
        }
    }
    
    func doneFishing() {
        if (DatabaseManager.shared.user.day < 7) {
           
            AddBombs()
            overlay = .seeNext
        }
        else {
            // TODO: display you win popup
            RestartGame();
        }
        DatabaseManager.shared.saveUser()
    }
    
    // show map of the next day
    func ShowBombs(startGame: Bool) {
        overlay = .basic
    
        for i in 0...Constants.numOfTilesInColumn-1{
            for j in 0...Constants.numOfTilesInRow-1{
                DatabaseManager.shared.map[i][j].isPressed = false
            }
        }
        
        for i in 0...3{
            DatabaseManager.shared.map[bombPlacementsRow[i]][bombPlacementsCol[i]].isPressed = true
        }
        DatabaseManager.shared.saveMap()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.overlay = nil
            if (!startGame){
                for i in 0...3{
                    DatabaseManager.shared.map[self.bombPlacementsRow[i]][self.bombPlacementsCol[i]].isPressed = false
                }
                TimerManager.shared.startTimer()
            }else{
                DatabaseManager.shared.user.day += 1
                DatabaseManager.shared.saveUser()
                self.StartLevel(skipAddDay: true)
            }
        }
    }

    // adds 4 new bombs
    func AddBombs(){
        var numBombs = 0
        var totalBombs = 4
        bombPlacementsRow = []
        bombPlacementsCol = []
        while (numBombs < totalBombs) {
            let randomRow = Int.random(in: 0..<6)
            let randomCol = Int.random(in: 0..<6)
            if (DatabaseManager.shared.map[randomRow][randomCol].value > 0) {
                DatabaseManager.shared.map[randomRow][randomCol].value = 0
                DatabaseManager.shared.map[randomRow][randomCol].imageFront = "bomb"
                numBombs += 1
                bombPlacementsRow.append(randomRow)
                bombPlacementsCol.append(randomCol)
            }
        }
        DatabaseManager.shared.saveMap()
    }
    
    // call this when failing a level and reset back to day 1
    func RestartGame(){
        //reinitalize map
        DatabaseManager.shared.reInitalizeMap()
        DatabaseManager.shared.user.currScore = 0
        DatabaseManager.shared.user.day = 0
        DatabaseManager.shared.saveUser()
        
        
        //get rid of overlay if there is one
        overlay = nil
        StartLevel(skipAddDay: false)
        
    }
}
