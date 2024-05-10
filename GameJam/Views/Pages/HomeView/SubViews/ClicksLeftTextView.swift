//
//  ClicksLeftTextView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct ClicksLeftTextView: View {
    @EnvironmentObject var gameManager: GameManager
    @EnvironmentObject var dbManager: DatabaseManager
    @EnvironmentObject var timerManager: TimerManager
    
    var body: some View {
        if (gameManager.requiredTaps == 0){
            GameButton(completion: {gameManager.doneFishing()}, text: "I'm Done Fishing").frame(width: 200, height: 80)
        }else{
            HStack{
                Text("Fish at least")
                    .foregroundColor(Constants.Colours.plainText)
                Text("\(gameManager.requiredTaps)").bold()
                    .foregroundColor(Constants.Colours.plainText)
                Text("more tiles today")
                    .foregroundColor(Constants.Colours.plainText)
            }.frame(height: 80)
        }
    }
}

#Preview {
    ClicksLeftTextView()
        .environmentObject(GameManager.shared)
}
