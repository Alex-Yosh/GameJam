//
//  GameOverOverlayView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct GameOverOverlayView: View {
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
                    Text("Oh no, you died")
                    Button(action:{
                        //TODO: do smth
                    }){
                        Rectangle()
                            .foregroundColor(.yellow)
                            .cornerRadius(15)
                            .padding()
                        
                    }
                }
            }.frame(maxWidth: 120, maxHeight: 200)
        }
    }
}

#Preview {
    GameOverOverlayView()
}
