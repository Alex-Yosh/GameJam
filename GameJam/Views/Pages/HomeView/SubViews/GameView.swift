//
//  GameView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameManager : GameManager
    @EnvironmentObject var dbManager : DatabaseManager
    var body: some View {
        VStack{
            DayTextView()
            GridView()
            ClicksLeftTextView()
            ScoresTextView()
        }
    }
}

#Preview {
    GameView()
        .environmentObject(GameManager.shared)
        .environmentObject(DatabaseManager.shared)
}
