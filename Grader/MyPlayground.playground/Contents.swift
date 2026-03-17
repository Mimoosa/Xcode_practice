//
//  GradingFunction.swift
//  Grader
//
//  Created by Monami Kirjavainen on 17.3.2026.
//

import Foundation

func arvosana(_ p: Double)-> Int?{
    if p > 100.0 || p < 0.0{
        return nil
    }
    if p < 40.0{
        return 0
    }else{
        let slope = (5.49 - 0.5) / 60.0
        return Int(round(0.5 + (p - 40) * slope))
    }
}

func grader (percentages: (Int, Int, Int)) -> (((Double, Double, Double)) -> Int?)?{
    if percentages.0 + percentages.1 + percentages.2 != 100{
        return nil
    }
    
    func grade(_ points:(Double, Double, Double))->Int?{
        var isvalidPoints:Bool = true
        
        let pointList = [points.0, points.1, points.2]
        
        pointList.forEach{if $0 < 0 || $0 > 100 {isvalidPoints = false}}
        if isvalidPoints == false{return nil}
        
        let percentageList = [percentages.0, percentages.1, percentages.2]
        
        var totalPoints: Double = 0
        
        pointList.enumerated().map{(index, value) in
            totalPoints += value * Double(percentageList[index]) / 100
        }
        
        return arvosana(totalPoints)
    }
    return grade
}

let g3 = grader(percentages:
(61, 30, 10))
if let g3 = g3 {
 print(g3((40.0, 40.0,
40.0)) ?? "N/A")
} else {
 print("no grader")
}

let g1 = grader(percentages:
(60, 30, 10))
if let g1 = g1 {
 print(g1((40.0, 40.0,
40.0)) ?? "N/A")
 print(g1((100.0, 100.0,
100.0)) ?? "N/A")
 print(g1((100.0, 11.0,
0.0)) ?? "N/A")
}

let g2 = grader(percentages:
(80, 20, 0))
if let g2 = g2 {
 print(g2((40.0, 40.0,
40.0)) ?? "N/A")
 print(g2((100.0, 100.0,
100.0)) ?? "N/A")
 print(g2((100.0, 110.0,
0.0)) ?? "N/A")
}
