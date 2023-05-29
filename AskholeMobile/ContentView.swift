//
//  ContentView.swift
//  AskholeMobile
//
//  Created by Russell Blickhan on 5/28/23.
//

import SwiftUI

struct ContentView: View {
    private let items: [Question]
    
    init() {
        items = Bundle.main.decode([Question].self, from: "questions.json")
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(items) { item in
                    Text(item.question)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
