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
    
    private let impact = UIImpactFeedbackGenerator(style: .medium)

    init(questions: [Question]) {
        self.questions = questions
    }

    var body: some View {
        VStack {
            CardView(question: questions[currentQuestion])
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 25, trailing: 20))
            Button("Randomize!", action: {
                currentQuestion = Int.random(in: 0 ..< questions.count)
                impact.impactOccurred()
            })
            .padding(.bottom, 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(questions: [Question(text: "What aspect about the person to your left gives you the strongest negative feeling?", id: 0)])
    }
}
