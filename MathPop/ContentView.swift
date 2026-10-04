//
//  ContentView.swift
//  MathPop
//
//  Created by Ruvaid on 01/10/26.
//

import SwiftUI

struct Question {
    let text: String
    let answer: Int
}

struct ContentView: View {
    @State private var gameStarted = false
    @State private var gameFinished = false

    @State private var selectedTable = 5
    @State private var questionCount = 5

    @State private var questions: [Question] = []
    @State private var questionNumber = 0
    @State private var userAnswer = ""
    @State private var score = 0

    var body: some View {
        VStack(spacing: 25) {
            Text("Multiplication Master")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)

            if !gameStarted {
                // Settings screen
                VStack(spacing: 20) {
                    Text("Choose Your Settings")
                        .font(.title2.bold())

                    Stepper("Tables up to: \(selectedTable)",
                            value: $selectedTable,
                            in: 2...12)
                        .font(.headline)

                    VStack(alignment: .leading) {
                        Text("Number of Questions")
                            .font(.headline)

                        Picker("Questions", selection: $questionCount) {
                            Text("5").tag(5)
                            Text("10").tag(10)
                            Text("20").tag(20)
                        }
                        .pickerStyle(.segmented)
                    }

                    Button("Start Game") {
                        startGame()
                    }
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding()
            } else if gameFinished {
                // Results screen
                VStack(spacing: 20) {
                    Text("🎉")
                        .font(.system(size: 70))

                    Text("Game Over!")
                        .font(.largeTitle.bold())

                    Text("Your Score")
                        .font(.title2)

                    Text("\(score) / \(questionCount)")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundStyle(.green)

                    Text("Great job! Keep practicing.")
                        .font(.headline)

                    Button("Play Again") {
                        resetGame()
                    }
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding()
            } else {
                // Game screen
                VStack(spacing: 25) {
                    Text("Question \(questionNumber + 1) of \(questions.count)")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    ProgressView(
                        value: Double(questionNumber + 1),
                        total: Double(questions.count)
                    )
                    .tint(.blue)

                    Text(questions[questionNumber].text)
                        .font(.system(size: 42, weight: .bold))
                        .padding()

                    TextField("Your Answer", text: $userAnswer)
                        .keyboardType(.numberPad)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    Button("Submit Answer") {
                        submitAnswer()
                    }
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(userAnswer.isEmpty ? .gray : .blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .disabled(Int(userAnswer) == nil)

                    Text("Score: \(score)")
                        .font(.headline)
                        .foregroundStyle(.green)
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }

    // Generate questions and start the game
    func startGame() {
        questions = (0..<questionCount).map { _ in
            let table = Int.random(in: 2...selectedTable)
            let multiplier = Int.random(in: 1...12)

            return Question(
                text: "\(table) × \(multiplier) = ?",
                answer: table * multiplier
            )
        }

        questionNumber = 0
        score = 0
        userAnswer = ""
        gameStarted = true
        gameFinished = false
    }

    // Check the user's answer
    func submitAnswer() {
        guard questionNumber < questions.count,
              let answer = Int(userAnswer) else {
            return
        }

        if answer == questions[questionNumber].answer {
            score += 1
        }

        userAnswer = ""

        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            gameFinished = true
        }
    }

    // Reset for another game
    func resetGame() {
        gameStarted = false
        gameFinished = false
        questions = []
        questionNumber = 0
        score = 0
        userAnswer = ""
    }
}

#Preview {
    ContentView()
}
