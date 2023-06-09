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
    @State private var previousQuestion: Int? = nil
    @AppStorage("lowerBound") private var lowerBound = 0
    @AppStorage("upperBound") private var upperBound = 0

    private let impact = UIImpactFeedbackGenerator(style: .medium)

    init(questions: [Question]) {
        self.questions = questions
        _currentQuestion = State(initialValue: Int.random(in: lowerBound ..< upperBound))
    }

    var body: some View {
        VStack {
            CardView(question: questions[currentQuestion])
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 25, trailing: 20))
            Button("Randomize!", action: randomizeQuestion)
                .padding(.bottom, 15)
                .onShake(action: randomizeQuestion)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SettingsView(), label: {
                    Image(systemName: "gear")
                })
            }
            if let previousQuestion {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back", action: {
                        currentQuestion = previousQuestion
                        self.previousQuestion = nil
                    })
                }
            }
        }
    }

    private func randomizeQuestion() {
        previousQuestion = currentQuestion
        currentQuestion = Int.random(in: lowerBound ..< upperBound)
        impact.impactOccurred()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            questions: [Question(
                text: "What aspect about the person to your left gives you the strongest negative feeling?",
                id: 0)])
    }
}
