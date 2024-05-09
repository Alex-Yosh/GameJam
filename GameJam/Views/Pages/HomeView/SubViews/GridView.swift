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
                        Text(String(tile.value))
                    }
                }
            }
        }
    }
}

#Preview {
    GridView()
}
