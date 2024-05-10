//
//  ScoresTextView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct ScoresTextView: View {
    @EnvironmentObject var dbManager : DatabaseManager

    var body: some View {
        HStack{
            Text("Current Score: \(dbManager.user.currScore)")
            Spacer()
            Text("High Score: \(dbManager.user.highScore)")
        }
    }
}

#Preview {
    ScoresTextView()
        .environmentObject(DatabaseManager.shared)
}
