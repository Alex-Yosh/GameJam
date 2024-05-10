//
//  GameOverOverlayView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct CoolDownOverlayView: View {
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
                    Text("See you tomorrow!")
            }.frame(maxWidth: 200, maxHeight: 120)
        }
    }
}

#Preview {
    CoolDownOverlayView()
}
