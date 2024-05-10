//
//  GridView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-09.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var dbManager : DatabaseManager
    
    var body: some View {
        Grid {
            ForEach(Array(dbManager.map.enumerated()), id: \.offset) { i, row in
                GridRow {
                    ForEach(Array(row.enumerated()), id: \.offset) { j, tile in
                        TileView(col: i, row: j, tile: tile)
                    }
                }
            }
        }
        .padding(25)
        .background(Constants.Colours.pond)
        .cornerRadius(50)
        
    }
}

#Preview {
    GridView()
        .environmentObject(GameManager.shared)
        .environmentObject(DatabaseManager.shared)
}
