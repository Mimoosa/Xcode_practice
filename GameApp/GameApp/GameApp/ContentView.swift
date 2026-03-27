//
//  ContentView.swift
//  GameApp
//
//  Created by Monami Kirjavainen on 27.3.2026.
//

import SwiftUI


struct ContentView: View {
    @State private(set) var playerScoreDictionary: [String: Int] = ["Emily": 10, "Matti": 20]
    @State private var newPlayerName = ""
    
    var body: some View {
            NavigationStack {
                VStack {
                    Text("Game Ranking")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .padding(.top)
                    
                    List {
                        ForEach(playerScoreDictionary.sorted(by: { $0.value > $1.value }), id: \.key) { name, score in

                            NavigationLink {
                                
                                // Opens the game screen and provides a callback
                                // to update the player's score when the game ends
                                UpDownGameUi() { score in
                                    guard let current = playerScoreDictionary[name] else { return }
                                    playerScoreDictionary[name] = max(current, score)
                                }
                            } label: {
                                HStack {
                                    Text(name)
                                    Text(score.description)
                                }
                            }

                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.black)
                    
                    Divider()
                    
                    HStack {
                        TextField("Add new player's name", text: $newPlayerName)
                            .textFieldStyle(.roundedBorder)
                        
                        Button{
                            // Adds a new player with score 0
                            if !newPlayerName.isEmpty {
                                playerScoreDictionary[newPlayerName] = 0
                                newPlayerName = ""
                            }
                        } label: {
                            Text("Add player")
                                .padding(.vertical, 8)
                                .cornerRadius(8)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()        }
    }
}

#Preview {
    ContentView()
}
