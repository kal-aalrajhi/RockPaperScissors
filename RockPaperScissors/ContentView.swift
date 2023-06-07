//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dr Cpt Blackbeard on 6/7/23.
//

//Each turn of the game the app will randomly pick either rock, paper, or scissors.
//Each turn the app will alternate between prompting the player to win or lose.
//The player must then tap the correct move to win or lose the game.
//If they are correct they score a point; otherwise they lose a point.
//The game ends after 10 questions, at which point their score is shown.
//So, if the app chose “Rock” and “Win” the player would need to choose “Paper”, but if the app chose “Rock” and “Lose” the player would need to choose “Scissors”.
/**
1. Start with an App template, then create a property to store the three possible moves: rock, paper, and scissors.
2. You’ll need to create two @State properties to store the app’s current choice and whether the player should win or lose.
3. You can use Int.random(in:) to select a random move. You can use it for whether the player should win too if you want, but there’s an even easier choice: Bool.random() is randomly true or false. After the initial value, use toggle() between rounds so it’s always changing.
4. Create a VStack showing the player’s score, the app’s move, and whether the player should win or lose. You can use if shouldWin to return one of two different text views.
5. The important part is making three buttons that respond to the player’s move: Rock, Paper, or Scissors.
6. Use the font() modifier to adjust the size of your text. If you’re using emoji for the three moves, they also scale. Tip: You can ask for very large system fonts using .font(.system(size: 200)) – they’ll be a fixed size, but at least you can make sure they are nice and big!
*/

import SwiftUI

struct ContentView: View {
    @State private var currentMove = Int.random(in: 0..<3)
    @State private var playerMove = Int.random(in: 0..<3)
    @State private var isWin = false

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
                            randomCondition()
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
        .padding()
    }
    
    func randomCondition() {
        currentMove = Int.random(in: 0..<3)
        isWin = Bool.random()
    }
    
    func moveChosen(_ number: Int) {
        print(currentMove)
        print(number)
        if (currentMove == number) {
            print("CORRECT!!!")
        } 
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
