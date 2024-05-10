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
        Text("Day " + String(dbManager.user.day))
    }
}

#Preview {
    DayTextView()
}
