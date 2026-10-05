//
//  ResultsView.swift
//  MathPop
//
//  Created by Ruvaid on 05/10/26.
//

import SwiftUI

struct ResultsView: View {
    let score: Int
    let totalQuestions: Int

    let playAgain: () -> Void

    var body: some View {
        VStack(spacing: 25) {
            Text("🎉")
                .font(.system(size: 70))

            Text("Game Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("You scored")
                .font(.title2)

            Text("\(score) / \(totalQuestions)")
                .font(.system(size: 50, weight: .bold))

            Button("Play Again") {
                playAgain()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
