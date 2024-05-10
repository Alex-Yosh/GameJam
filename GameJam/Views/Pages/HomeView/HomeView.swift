//
//  HomeView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-02.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @EnvironmentObject var gameManager : GameManager
    @EnvironmentObject var dbManager : DatabaseManager

    
    var body: some View {
        ZStack(){
            GameView()
            GameOverOverlayView()
            if let overlay = gameManager.overlay{
                switch(overlay){
                case .gameOver:
                    GameOverOverlayView()
                case .restart:
                    RestartOverlayView()
                case .seeNext:
                    SeeNextOverlayView()
                }
            }
        }
    }
}



#Preview {
    HomeView()
        .environmentObject(GameManager.shared)
        .environmentObject(DatabaseManager.shared)
}
