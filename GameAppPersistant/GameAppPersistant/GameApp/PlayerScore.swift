//
//  PlayerScore.swift
//  GameApp
//
//  Created by Monami Kirjavainen on 31.3.2026.
//

import Foundation
import SwiftData

@Model
class PlayerScore{
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
