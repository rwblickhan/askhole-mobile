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
    @AppStorage("enableOriginalQuestions") private var enableOriginalQuestions = true
    @AppStorage("enableExtraQuestions") private var enableExtraQuestions = true
    
    private var originalQuestions: [String]
    private var extraQuestions: [String]
    private var allQuestions: [String] {
        var list = enableOriginalQuestions ? originalQuestions : [];
        if enableExtraQuestions {
            list.append(contentsOf: extraQuestions)
        }
        return list
    }
    init() {
        originalQuestions = Bundle.main.decode([String].self, from: "questions.json")
        extraQuestions = Bundle.main.decode([String].self, from: "extra_questions.json")
        if (upperBound == 0 || upperBound > allQuestions.count) {
            upperBound = allQuestions.count
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(questions: allQuestions)
            }
        }
    }
}
