//
//  CardView.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 6/10/23.
//

import SwiftUI

struct CardView: View {
    let question: Question
    
    var body: some View {
            Text(question.text)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(question: Question(text: "What aspect about the person to your left gives you the strongest negative feeling?", id: 0))
    }
}
