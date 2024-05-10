//
//  GameButton.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct GameButton: View {
    var completion: () -> Void
    var text: String
    
    var body: some View {
        VStack{
            Button(action:{
                    completion()
            }){
                ZStack{
                    Rectangle()
                        .foregroundColor(Constants.Colours.accent)
                        .cornerRadius(15)
                        .padding()
                    Text(text)
                        .foregroundColor(Constants.Colours.buttonText)
                }
            }
        }
    }
}

#Preview {
    GameButton(completion: {}, text: "text")
}
