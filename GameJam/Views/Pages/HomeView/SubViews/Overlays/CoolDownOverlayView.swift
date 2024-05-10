//
//  GameOverOverlayView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct CoolDownOverlayView: View {
    
    @EnvironmentObject var timerManager: TimerManager
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                    Text("\(timerManager.hour) : \(timerManager.minute) : \(timerManager.second)")
                    Text("See you tomorrow!")
                }
            }.frame(maxWidth: 200, maxHeight: 120)
        }.onReceive(timer) { _ in
            if timerManager.hasCountdownCompleted {
                timer.upstream.connect().cancel() // turn off timer
                timerManager.endTimer()
            } else {
                timerManager.updateTimer()
            }
        }
    }
}

#Preview {
    CoolDownOverlayView()
        .environmentObject(TimerManager.shared)
}
