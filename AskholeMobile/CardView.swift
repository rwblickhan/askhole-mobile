//
//  CardView.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 6/10/23.
//

import SwiftUI

struct CardView: View {
    let question: String
    let index: Int

    var body: some View {
        Text(question)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .topTrailing) {
                Text("#\(index)")
                    .foregroundColor(.gray)
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            question:
                "What aspect about the person to your left gives you the strongest negative feeling?",
            index: 0)
    }
}
