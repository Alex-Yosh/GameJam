//
//  GameJamApp.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-02.
//

import SwiftUI

@main
struct GameJamApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(DatabaseManager.shared)
                .environmentObject(GameManager.shared)
                .environmentObject(TimerManager.shared)
        }
    }
}
