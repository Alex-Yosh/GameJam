//
//  ClicksLeftTextView.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import SwiftUI

struct ClicksLeftTextView: View {
    var body: some View {
//        GameButton(completion: {}, text: "I'm Done Fishing").frame(width: 200, height: 80)
        HStack{
            Text("Fish at least")
            Text("\(2)").bold()
            Text("more tiles today")
        }
    }
}

#Preview {
    ClicksLeftTextView()
}
