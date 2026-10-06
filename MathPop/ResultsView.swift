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

    var percentage: Int {
        if totalQuestions == 0 {
            return 0
        }

        return (score * 100) / totalQuestions
    }

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            Text("🎉")
                .font(.system(size: 80))

            Text("Game Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 8) {
                Text("Your Score")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text("\(score) / \(totalQuestions)")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundStyle(.blue)

                Text("\(percentage)%")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(radius: 15)
            .padding(.horizontal)

            Button {
                playAgain()
            } label: {
                Text("Play Again")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .padding(.horizontal)

            Spacer()
        }
    }
}
