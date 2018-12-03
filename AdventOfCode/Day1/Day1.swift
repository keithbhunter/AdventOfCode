//
//  Day1.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/2/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

struct Day1 {
    
    // +1, -1, ...
    private var frequencyChanges = [Int]()
    
    /// Inits with the input data for AOC.
    init() {
        let url = Bundle.main.url(forResource: "day1-input", withExtension: "txt")!
        let data = try! Data(contentsOf: url)
        let str = String(data: data, encoding: .utf8)
        frequencyChanges = str!.components(separatedBy: "\n").compactMap { Int($0) }
    }
    
    /// Helper init for test data injection with smaller examples.
    init(frequencyChanges: [Int]) {
        self.frequencyChanges = frequencyChanges
    }
    
    func resultingFrequencyAfterAllChanges() -> Int {
        var total = 0
        for number in frequencyChanges {
            total += number
        }
        return total
    }
    
    func firstFrequencyToOccurTwice() -> Int? {
        var frequencyMap = [0 : 1]
        var total = 0
        
        repeat {
            for number in frequencyChanges {
                total += number
                
                if let count = frequencyMap[total] {
                    frequencyMap[total] = count + 1
                } else {
                    frequencyMap[total] = 1
                }
                
                if frequencyMap[total] == 2 {
                    return total
                }
            }
        } while (true)
    }
    
}
