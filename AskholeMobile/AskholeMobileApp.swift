//
//  AskholeMobileApp.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 5/28/23.
//

import SwiftUI

@main
struct AskholeMobileApp: App {
    private var questions: [Question]
    init() {
        questions = Bundle.main.decode([Question].self, from: "questions.json")
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(questions: questions)
            }
        }
    }
}
