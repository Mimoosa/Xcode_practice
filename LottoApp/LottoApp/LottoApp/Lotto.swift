//
//  Lotto.swift
//  LottoApp
//
//  Created by Monami Kirjavainen on 20.4.2026.
//

import Foundation

class Lotto{
    private let correctNumbers: [Int]
    
    init(){
        self.correctNumbers = Array(1...40).shuffled().prefix(7).map { $0 }
    }
    
    func checkHowManyNumbersMatched(_ guessedNumbers: [Int]) -> Int {
        return Set(correctNumbers).intersection(guessedNumbers).count
    }
    
    
}
