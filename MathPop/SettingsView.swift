//
//  SettingsView.swift
//  MathPop
//
//  Created by Ruvaid on 05/10/26.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedTable = 9
    @State private var numberOfQuestions = 5

    let startGame: (Int, Int) -> Void

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            VStack(spacing: 8) {
                Text("Multiplication")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Text("Master your tables")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.8))
            }

            VStack(spacing: 25) {
                VStack(spacing: 12) {
                    Text("Practice tables up to")
                        .font(.headline)

                    Text("Table \(selectedTable)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.blue)

                    Stepper(
                        "Up to \(selectedTable)",
                        value: $selectedTable,
                        in: 2...12
                    )
                    .padding(.horizontal)
                }

                Divider()

                VStack(spacing: 12) {
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
            }
            .padding(25)
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.91, green: 0.97, blue: 0.90),
                        Color(red: 0.76, green: 0.89, blue: 0.79)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 15)
            .padding(.horizontal)

            Button {
                startGame(selectedTable, numberOfQuestions)
            } label: {
                Text("Start Game")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .padding(.horizontal)
            .scaleEffect(1.0)

            Spacer()
        }
    }
}
