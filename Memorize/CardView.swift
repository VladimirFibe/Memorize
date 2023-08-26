//
//  CardView.swift
//  Memorize
//
//  Created by Vladimir Fibe on 26.08.2023.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                shape
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
            print("Yes!!!")
        }
        .aspectRatio(2/3, contentMode: .fill)
    }
}
