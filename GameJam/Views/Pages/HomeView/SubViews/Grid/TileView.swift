//
//  TileView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct TileView: View {
    @EnvironmentObject var dbManager : DatabaseManager
    var col: Int
    var row: Int
    var tile: Tile

    
    var body: some View {
        Button(action:{
            dbManager.map[col][row].isPressed = true
        }){
            ZStack{
                Rectangle()
                    .foregroundColor(tile.isPressed ? Color.red : Color.blue)
                    .cornerRadius(10)
                    .rotation3DEffect(
                        .degrees(tile.isPressed ? 180: 0), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                    )
//                            tile.isPressed ? Image(tile.imageFront) : Image(tile.imageBack)
                Text(String(tile.value))
            }.frame(width: 48, height: 48)
        }.disabled(tile.isPressed)
    }
}

#Preview {
    TileView(col: 1, row: 1, tile: Tile(imageFront: "", imageBack: "", isPressed: false, value: 1))
}

