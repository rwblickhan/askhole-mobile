//
//  ContentView.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 5/28/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    private let items: [Question]
    @State private var currentQuestion = 0

    init() {
        items = Bundle.main.decode([Question].self, from: "questions.json")
    }

    var body: some View {
        VStack {
            Text(items[currentQuestion].question)
                .padding()
            Spacer()
            Button("Random", action: {
                currentQuestion = Int.random(in: 0 ..< items.count)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
