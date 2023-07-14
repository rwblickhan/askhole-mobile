//
//  AskholeMobileApp.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 5/28/23.
//

import SwiftUI

@main
struct AskholeMobileApp: App {
    @AppStorage("lowerBound") private var lowerBound = 0
    @AppStorage("upperBound") private var upperBound = 0
    
    private var questions: [Question]
    init() {
        questions = Bundle.main.decode([Question].self, from: "questions.json")
        if (upperBound == 0) {
            upperBound = questions.count
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(questions: questions)
            }
        }
    }
}
