//
//  UpDownGame.swift
//  GameApp
//
//  Created by Monami Kirjavainen on 27.3.2026.
//  Note: UpDownGame is a struct so each game session gets a fresh copy.
//

import Foundation

struct UpDownGame {
    enum GuessResult {
        case Low, High, Hit
    }
    let low: Int
    let high: Int
    private(set) var guesses: [Int]
        
    let secret: Int
    
    private(set) var startTime: Date
    private(set) var endTime: Date?
    
    init(low: Int = 1, high: Int = 10) {
        self.low = low
        self.high = high
        self.guesses = []
        self.secret = Int.random(in: low...high)
        self.startTime = Date()
        self.endTime = nil
        print("Secret \(secret)")
    }
    mutating func makeGuess(guess: Int) -> GuessResult {
        guesses.append(guess)
        switch guess {
        case ..<secret:
            return .Low
        case secret:
            endTime = Date()
            return .Hit
        case (secret+1)...:
            return .High
        default:
            fatalError()
        }
    }
    
    // Calculate how long the game took by comparing start and end times
    var duration: TimeInterval? {
        guard let endTime else{return nil}
        return endTime.timeIntervalSince(startTime)
    }
    
    // Higher score for fewer guesses and faster time
    var score: Int?{
        let seconds = Int(duration!)
        return (1000 / guesses.count) + (1000 / seconds)
    }
}
