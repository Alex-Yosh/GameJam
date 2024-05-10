//
//  RestartOverlayView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct RestartOverlayView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
                .frame(width: .infinity, height: .infinity)
                .opacity(0.7)
            ZStack{
                Rectangle()
                    .foregroundColor(Constants.Colours.background)
                    .cornerRadius(10)
                VStack{
                    Text("Oh no, you died :(")
                        .foregroundStyle(.red)
                        .padding(.top)
                        .foregroundColor(Constants.Colours.plainText)
                    GameButton(completion: {}, text: "Restart Game")
                }
            }.frame(maxWidth: 200, maxHeight: 120)
        }
    }
}

#Preview {
    RestartOverlayView()
}
