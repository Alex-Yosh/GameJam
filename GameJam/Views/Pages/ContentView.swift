//
//  ContentView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-02.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var arr: [[Int]] = [[1, 2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]
    
    var body: some View {
        Grid {
            ForEach(0..<5) { index in
                GridRow {
                    ForEach(0..<5, id: \.self) { ind in
                        Text(String((arr[index][ind])))
                    }
                }
            }
        }
    }
    
    
}



#Preview {
    ContentView()
}
