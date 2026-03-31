//
//  ContentView.swift
//  GameApp
//
//  Created by Monami Kirjavainen on 27.3.2026.
//  Updated by Monami on 31.3.2026
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Query(sort: [SortDescriptor(\PlayerScore.score, order: .reverse)]) private var playerScores: [PlayerScore]
    @Environment(\.modelContext) private var context
    
    @State private var newPlayerName = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Game Ranking")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading)
                            .padding(.top)
                
                List(playerScores) { playerScore in
                    
                    NavigationLink {
                        
                        // Opens the game screen and provides a callback
                        // to update the player's score when the game ends
                        UpDownGameUi() { newScore in
                            playerScore.score = max(playerScore.score, newScore)
                        }
                    } label: {
                        HStack {
                            Text(playerScore.name)
                            Spacer()
                            Text(playerScore.score.description)
                        }
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.black)
                
                VStack(alignment: .center, spacing: 20) {
                    Text("New Player")
                        .font(.headline)
                    HStack{
                        TextField("Add new player's name", text: $newPlayerName)
                            .textFieldStyle(.roundedBorder)
                        
                        Button{
                            // Adds a new player with score 0
                            if !newPlayerName.isEmpty {
                                context.insert(PlayerScore(name: newPlayerName, score: 0))
                                newPlayerName = ""
                            }
                        } label: {
                            Text("Add player")
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(Color.black)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
            }
        }
        .padding()

        }
    }


#Preview {
    ContentView()
        .modelContainer(for: PlayerScore.self, inMemory: true)
}
