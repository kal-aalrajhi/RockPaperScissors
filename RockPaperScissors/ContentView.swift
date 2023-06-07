//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dr Cpt Blackbeard on 6/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentMove = Int.random(in: 0..<3)
    @State private var playerMove = Int.random(in: 0..<3)
    @State private var isWin = false
    @State private var isShowingScore = false
    @State private var gameMessage = ""
    @State private var score = 0
    @State private var questionCounter = 0
    @State private var isGameOver = false

    let moves = ["🪨", "📄", "✂️"]
    let loseMoves = ["📄", "✂️", "🪨"]
    let winMoves = ["✂️", "🪨", "📄"]
    
    var body: some View {
        VStack {
            Spacer()
            Text("Rock, Paper, Scissors")
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
                .font(.title2.monospaced().weight(.heavy))
            
            Spacer()
            VStack(spacing: 30) {
                Text("Condition to Match: ")
                    .font(.title3.monospaced().weight(.semibold))
                HStack {
                    Text(moves[currentMove])
                        .shadow(radius: 5)
                    Text(isWin ? "| win" : "| lose")
                }
            }
            .font(.system(size:70))
            
            Spacer()
            VStack(spacing: 30) {
                Text("Choose a move: ")
                    .font(.title3.monospaced().weight(.semibold))
                HStack(spacing: 30) {
                    ForEach(0..<3) { number in
                        Button {
                            moveChosen(number)
                        } label: {
                            Text(isWin ? winMoves[number] : loseMoves[number])
                                .font(.system(size:70))
                                .shadow(radius: 5)
                        }
                    }
                }
            }
            Spacer()
        }
        .alert(gameMessage, isPresented: $isShowingScore) {
            Button("Continue", action: randomCondition)
        } message: {
            Text("Your current score is \(score)")
        }
        .alert(gameMessage, isPresented: $isGameOver) {
            Button("Start New Game", action: resetGame)
        } message: {
            Text("Your final score is \(score) out of 5")
        }
    }
    
    func randomCondition() {
        currentMove = Int.random(in: 0..<3)
        isWin.toggle()
    }
    
    func moveChosen(_ number: Int) {
        questionCounter += 1
        
        if currentMove == number {
            score += 1
            gameMessage = "Correct!"
        } else {
            if score > 0 {
                score -= 1
            }
            gameMessage = "Incorrect."
        }
        
        if questionCounter == 5 {
            isGameOver = true
        } else {
            isShowingScore = true
        }
    }
    
    func resetGame() {
        score = 0
        questionCounter = 0
        randomCondition()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
