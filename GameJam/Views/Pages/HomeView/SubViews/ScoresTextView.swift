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
                .background(Constants.Colours.grayScore
                    .cornerRadius(12))
            
            Spacer()
            Text("Best: \(dbManager.user.highScore)")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Constants.Colours.grayScore
                    .cornerRadius(12))
        }
    }
}

#Preview {
    ScoresTextView()
        .environmentObject(DatabaseManager.shared)
}
