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
            GameView().allowsHitTesting(gameManager.overlay == nil)
            if let overlay = gameManager.overlay{
                switch(overlay){
                case .coolDown:
                    CoolDownOverlayView()
                case .restart:
                    RestartOverlayView()
                case .seeNext:
                    SeeNextOverlayView()
                case .basic:
                    EmptyView()
                }
            }
        }.onAppear(perform: {
            if (dbManager.user.endDate > Date.now){
                timerManager.startTimer()
            }
            else{
                gameManager.overlay = nil
                if (!gameManager.startedLevel){
                    gameManager.StartLevel(skipAddDay: false)
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
