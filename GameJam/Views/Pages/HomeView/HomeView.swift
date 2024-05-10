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
    @EnvironmentObject var timerManager : TimerManager

    
    var body: some View {
        ZStack(){
            GameView()
            if let overlay = gameManager.overlay{
                switch(overlay){
                case .coolDown:
                    CoolDownOverlayView()
                case .restart:
                    RestartOverlayView()
                case .seeNext:
                    SeeNextOverlayView()
                }
            }
        }.onAppear(perform: {
            if (dbManager.user.endDate > Date.now){
                timerManager.startTimer()
            }
            else{
                gameManager.overlay = nil
                if (!gameManager.startedLevel){
                    gameManager.StartLevel()
                }
            }
        })
    }
}



#Preview {
    HomeView()
        .environmentObject(GameManager.shared)
        .environmentObject(DatabaseManager.shared)
}
