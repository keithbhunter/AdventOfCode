//
//  Day3.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/3/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

class Day3 {
    
    private typealias Row = Int
    private typealias Column = Int
    
    private var claims = [Claim]()
    
    /// Inits with the input data for AOC.
    init() {
        let str = Bundle.main.string(forTextResource: "day3-input")
        claims = str.components(separatedBy: "\n").map { Claim(string: $0) }
    }
    
    /// Helper init for test data injection with smaller examples.
    init(claims: [String]) {
        self.claims = claims.map { Claim(string: $0) }
    }
    
    func findContestedSquareInches() -> Int {
        var heatMap = [Row : [Column : Int]]()
        
        for claim in claims {
            for row in claim.frame.x ..< claim.frame.x + claim.frame.width {
                for column in claim.frame.y ..< claim.frame.y + claim.frame.height {
                    if heatMap[row] == nil {
                        heatMap[row] = [column : 0]
                    }
                    
                    if let columnCount = heatMap[row] {
                        if let count = columnCount[column] {
                            heatMap[row]![column] = count + 1
                        } else {
                            heatMap[row]![column] = 1
                        }
                    }
                }
            }
        }
        
        return heatMap.reduce(0, { (result, arg1) -> Int in
            let (_, columnCount) = arg1
            return result + columnCount.filter { $0.value > 1 }.count
        })
    }
    
}
