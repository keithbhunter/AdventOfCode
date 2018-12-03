//
//  Day2.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/3/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

class Day2 {
    
    private var ids = [String]()
    
    /// Inits with the input data for AOC.
    init() {
        let data = Bundle.main.data(forTextResource: "day2-input")
        let str = String(data: data, encoding: .utf8)
        ids = str!.components(separatedBy: "\n")
    }
    
    /// Helper init for test data injection with smaller examples.
    init(ids: [String]) {
        self.ids = ids
    }
    
    func calculateChecksum() -> Int {
        var twoLetterMatches = 0
        var threeLetterMatches = 0
        
        for id in ids {
            var letterCounts = [Character : Int]()
            
            for char in id {
                if let count = letterCounts[char] {
                    letterCounts[char] = count + 1
                } else {
                    letterCounts[char] = 1
                }
            }
            
            twoLetterMatches += letterCounts.values.filter { $0 == 2 }.isEmpty ? 0 : 1
            threeLetterMatches += letterCounts.values.filter { $0 == 3 }.isEmpty ? 0 : 1
        }
        
        return twoLetterMatches * threeLetterMatches
    }
    
}
