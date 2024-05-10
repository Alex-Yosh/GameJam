//
//  SeeNextOverlayView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct SeeNextOverlayView: View {
    @EnvironmentObject var dbManager : DatabaseManager
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
                .frame(width: .infinity, height: .infinity)
                .opacity(0.7)
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                VStack{
                    Text("Day \(dbManager.user.day) completed!")
                        .padding(.top)
                    Text("Show tomorrow's bombs?")
                    GameButton(completion: {}, text: "Show Bombs")
                }
            }.frame(maxWidth: 250, maxHeight: 150)
        }
    }
}

#Preview {
    SeeNextOverlayView()
        .environmentObject(DatabaseManager.shared)
}
