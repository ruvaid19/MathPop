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
        VStack(spacing: 30) {
            Text("Question \(questionNumber + 1) of \(questions.count)")
                .font(.headline)

            Text(questions[questionNumber].text)
                .font(.system(size: 50, weight: .bold))

            TextField("Your answer", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button("Submit") {
                if let answer = Int(userAnswer) {
                    let isCorrect = answer == questions[questionNumber].answer

                    answerSubmitted(isCorrect)

                    userAnswer = ""
                }
            }
            .buttonStyle(.borderedProminent)

            Text("Score: \(score)")
                .font(.headline)
        }
        .padding()
    }
}
