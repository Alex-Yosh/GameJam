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
                        Button(action:{
                            dbManager.map[i][j].isPressed = true
                        }){
                            ZStack{
                                tile.isPressed ? Color.red : Color.white
    //                            tile.isPressed ? Image(tile.imageFront) : Image(tile.imageBack)
                                Text(String(tile.value))
                            }.frame(width: 64, height: 64)
                        }.disabled(tile.isPressed)
                    }
                }
            }
        }
    }
}

#Preview {
    GridView()
}
