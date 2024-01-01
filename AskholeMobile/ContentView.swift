//
//  ContentView.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 5/28/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    private var questions: [String]
    @State private var currentQuestionIndex = 0
    @State private var previousQuestionIndex: Int? = nil
    @AppStorage("lowerBound") private var lowerBound = 0
    @AppStorage("upperBound") private var upperBound = 0

    private let impact = UIImpactFeedbackGenerator(style: .medium)

    init(questions: [String]) {
        self.questions = questions
        _currentQuestionIndex = State(initialValue: Int.random(in: lowerBound ..< upperBound))
    }

    var body: some View {
        VStack {
            CardView(question: questions[currentQuestionIndex], index: currentQuestionIndex)
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
            if let previousQuestionIndex {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back", action: {
                        currentQuestionIndex = previousQuestionIndex
                        self.previousQuestionIndex = nil
                    })
                }
            }
        }
    }

    private func randomizeQuestion() {
        previousQuestionIndex = currentQuestionIndex
        currentQuestionIndex = Int.random(in: lowerBound ..< upperBound)
        impact.impactOccurred()
        print("upperBound: \(upperBound)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            questions: [
                "What aspect about the person to your left gives you the strongest negative feeling?"])
                
    }
}
