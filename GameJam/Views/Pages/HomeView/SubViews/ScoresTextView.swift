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
                
            Text("Score: \(dbManager.user.currScore)")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Constants.Colours.subText)
            
            Spacer()
            Text("Best: \(dbManager.user.highScore)")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Constants.Colours.subText)
                
        }
    }
}

#Preview {
    ScoresTextView()
        .environmentObject(DatabaseManager.shared)
}
