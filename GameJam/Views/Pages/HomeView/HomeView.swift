//
//  HomeView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-02.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @EnvironmentObject var dbmanager : DatabaseManager

    
    var body: some View {
        VStack{
            GridView()
        }
    }
}



#Preview {
    HomeView()
}
