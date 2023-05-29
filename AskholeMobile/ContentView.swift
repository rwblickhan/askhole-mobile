//
//  ContentView.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 5/28/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    private var questions: [Question]
    @State private var currentQuestion = 0

    init(questions: [Question]) {
        self.questions = questions
    }

    var body: some View {
        VStack {
            Spacer()
            Text(questions[currentQuestion].text)
                .padding()
            Spacer()
            Button("Random", action: {
                currentQuestion = Int.random(in: 0 ..< questions.count)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(questions: [])
    }
}
