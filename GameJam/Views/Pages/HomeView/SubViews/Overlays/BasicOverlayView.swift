//
//  BasicOverlayView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct BasicOverlayView: View {
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
                .frame(width: .infinity, height: .infinity)
                .opacity(0.6)
        }
    }
}

#Preview {
    BasicOverlayView()
}
