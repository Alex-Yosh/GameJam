//
//  GameManager.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-09.
//

import Foundation


final class GameManager: ObservableObject{
    static let shared = GameManager() //singleton
    
    func onTap(){
        DatabaseManager.shared.saveMap()
    }
}
