//
//  SettingsView.swift
//  MathPop
//
//  Created by Ruvaid on 05/10/26.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedTable = 2
    @State private var numberOfQuestions = 5

    let startGame: (Int, Int) -> Void

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Multiplication Master")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                VStack {
                    Text("Choose your table")
                        .font(.headline)

                    Stepper(
                        "Table: \(selectedTable)",
                        value: $selectedTable,
                        in: 2...12
                    )
                }

                VStack {
                    Text("Number of questions")
                        .font(.headline)

                    Picker(
                        "Questions",
                        selection: $numberOfQuestions
                    ) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("20").tag(20)
                    }
                    .pickerStyle(.segmented)
                }

                Button("Start Game") {
                    startGame(selectedTable, numberOfQuestions)
                }
                .buttonStyle(.borderedProminent)
                .font(.headline)
            }
            .padding()
            .navigationTitle("Practice")
        }
    }
}
