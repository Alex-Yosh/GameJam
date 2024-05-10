//
//  DayTextView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct DayTextView: View {
    @EnvironmentObject var dbManager : DatabaseManager
    var body: some View {
        VStack{
            Text("Day " + String(dbManager.user.day)).bold().padding()
            Text("Find fish, avoid bombs")
        }
    }
}

#Preview {
    DayTextView()
        .environmentObject(DatabaseManager.shared)
}
