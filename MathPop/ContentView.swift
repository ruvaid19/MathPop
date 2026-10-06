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

    @State private var selectedTable = 5
    @State private var numberOfQuestions = 5

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.8),
                    Color.purple.opacity(0.8)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            if showResults {
                ResultsView(
                    score: score,
                    totalQuestions: questions.count
                ) {
                    showResults = false
                    gameStarted = false
                }
                .transition(.scale.combined(with: .opacity))

            } else if gameStarted {
                GameView(
                    questions: questions,
                    questionNumber: questionNumber,
                    score: score
                ) { isCorrect in

                    if isCorrect {
                        score += 1
                    }

                    withAnimation {
                        if questionNumber == questions.count - 1 {
                            gameStarted = false
                            showResults = true
                        } else {
                            questionNumber += 1
                        }
                    }
                }
                .transition(.move(edge: .trailing))
            } else {
                SettingsView { table, questionsCount in

                    selectedTable = table
                    numberOfQuestions = questionsCount

                    questions = []

                    for _ in 0..<questionsCount {
                        let tableNumber = Int.random(in: 2...table)
                        let number = Int.random(in: 2...12)

                        let answer = tableNumber * number
                        let text = "\(tableNumber) × \(number)"

                        let question = Question(
                            text: text,
                            answer: answer
                        )

                        questions.append(question)
                    }

                    score = 0
                    questionNumber = 0
                    showResults = false

                    withAnimation {
                        gameStarted = true
                    }
                }
                .transition(.opacity)
            }
        }
    }
}
