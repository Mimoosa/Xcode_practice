//
//  ContentView.swift
//  NumberGuessingGame
//
//  Created by Monami Kirjavainen on 23.3.2026.
//

import SwiftUI

struct ContentView: View {
    let game = YliAliGame(low:1, high:100)
    @State private var currentGuess = ""
    @State private var result: YliAliGame.GuessResult?
    @State private var feedback: String?
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "gamecontroller")
                
                Text("Number Guessing Game")
            }
            .font(.title)
            
            Divider()
            
            Text("Please guess the number from 1 to 100 and type it in.")
                .padding()
            
            TextField("Enter your guess here", text: $currentGuess,
                      prompt: Text("Enter your guess here").foregroundColor(.white.opacity(0.6)))
                .textFieldStyle(.plain)
                .foregroundColor(.white)
                .onSubmit {
                    if !currentGuess.isEmpty {
                        // If the user enters something other than an integer, an error message will appear in the UI.
                        if Int(currentGuess) == nil{
                            feedback = "Please enter a valid number."
                        } else {
                            feedback = nil
                            result = game.makeGuess(guess: Int(currentGuess) ?? 0)
                        }
                        
                    }
                    currentGuess = ""
                }
                .padding()
            
            Divider()
            Text(feedback ?? "")
                .foregroundStyle(.red)
            
            if let result = result {
                switch result{
                case .Low:
                    Text("Too low!")
                        .font(.title2)
                        .bold()
                case .Hit:
                    VStack {
                        Text("Correct! The number was \(game.secret)")
                            .font(.title2)
                            .bold()
                        Text("You got it in \(game.guesses.count) tries!")
                    }
                case .High:
                    Text("Too high!")
                        .font(.title2)
                        .bold()
                }
            }
            
        }
        .padding()
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
        
    }
}

#Preview {
    ContentView()
}
