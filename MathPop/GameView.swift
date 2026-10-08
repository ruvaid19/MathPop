//
//  GameView.swift
//  MathPop
//
//  Created by Ruvaid on 05/10/26.
//

import SwiftUI

struct GameView: View {
    let questions: [Question]
    let questionNumber: Int
    let score: Int

    let answerSubmitted: (Bool) -> Void

    @State private var userAnswer = ""

    var body: some View {
        VStack(spacing: 25) {

            HStack {
                VStack(alignment: .leading) {
                    Text("Question")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Text("\(questionNumber + 1) / \(questions.count)")
                        .font(.title2)
                        .fontWeight(.bold)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Score")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Text("\(score)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .contentTransition(.numericText())
                }
            }

            ProgressView(
                value: Double(questionNumber + 1),
                total: Double(questions.count)
            )
            .tint(.blue)

            Spacer()

            VStack(spacing: 20) {
                Text("Solve this")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text(questions[questionNumber].text)
                    .font(.system(size: 55, weight: .bold))
                    .contentTransition(.numericText())
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 45)
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
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(radius: 15)
            .padding(.horizontal)

            TextField("Enter your answer", text: $userAnswer)
                .keyboardType(.numberPad)
                .font(.title)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button {
                submitAnswer()
            } label: {
                Text("Submit Answer")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }

    private func submitAnswer() {
        if let answer = Int(userAnswer) {
            let isCorrect = answer == questions[questionNumber].answer

            answerSubmitted(isCorrect)

            userAnswer = ""
        }
    }
}
