//
//  HomeView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-02.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @EnvironmentObject var gameManager : GameManager

    
    var body: some View {
        VStack{
            GridView()
            Button(action:{
                gameManager.onTap()
            }){
                Text("click")
            }
        }
    }
}



#Preview {
    HomeView()
}
