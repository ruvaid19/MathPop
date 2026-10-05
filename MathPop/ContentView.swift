//
//  ContentView.swift
//  MathPop
//
//  Created by Ruvaid on 01/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var gameStarted = false
    @State private var showResults = false

    @State private var questions: [Question] = []
    @State private var questionNumber = 0
    @State private var score = 0

    var body: some View {
        if showResults {
            ResultsView(
                score: score,
                totalQuestions: questions.count,
                playAgain: {
                    showResults = false
                }
            )
        } else if gameStarted {
            GameView(
                questions: questions,
                questionNumber: questionNumber,
                score: score
            ) { isCorrect in

                if isCorrect {
                    score += 1
                }

                if questionNumber == questions.count - 1 {
                    gameStarted = false
                    showResults = true
                } else {
                    questionNumber += 1
                }
            }
        } else {
            SettingsView { table, numberOfQuestions in

                questions = []

                for _ in 0..<numberOfQuestions {
                    let number = Int.random(in: 2...12)
                    let answer = table * number
                    let text = "\(table) × \(number)"

                    let question = Question(
                        text: text,
                        answer: answer
                    )

                    questions.append(question)
                }

                score = 0
                questionNumber = 0
                showResults = false
                gameStarted = true
            }
        }
    }
}
