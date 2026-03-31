//
//  Player.swift
//  ScoreKeeper
//
//  Created by Monami Kirjavainen on 31.3.2026.
//

import Foundation

struct Player : Identifiable {
    var id = UUID()
    
    var name: String
    var score: Int
}
