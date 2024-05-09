//
//  GridRowView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-09.
//

import SwiftUI

struct GridRowView: View {
    @EnvironmentObject var dbmanager : DatabaseManager
    var column: Int
    
    var body: some View {
        GridRow {
                ForEach(0..<8, id: \.self) { row in
                    Text(String(dbmanager.map[column][row].value))
                }
            
        }
    }
}

#Preview {
    GridRowView( column: 1)
}
