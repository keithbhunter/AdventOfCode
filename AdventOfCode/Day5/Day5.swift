//
//  Day5.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/7/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

class Day5 {
    
    private let polymer: String
    
    /// Inits with the input data for AOC.
    init() {
        let str = Bundle.main.string(forTextResource: "day5-input")
        polymer = str.trimmingCharacters(in: .newlines)
    }
    
    /// Helper init for test data injection with smaller examples.
    init(input: String) {
        polymer = input
    }
    
    func triggerPolymer() -> String {
        var polymerCopy = polymer
        var shouldRepeat: Bool
        
        repeat {
            shouldRepeat = false
            
            for i in 0 ..< polymerCopy.count - 1 {
                let index = polymerCopy.index(polymerCopy.startIndex, offsetBy: i)
                let firstChar = String(polymerCopy[index])
                let secondChar = String(polymerCopy[polymerCopy.index(after: index)])
                
                if firstChar.compare(secondChar, options: .caseInsensitive) == .orderedSame && firstChar != secondChar {
                    polymerCopy.remove(at: polymerCopy.index(after: index))
                    polymerCopy.remove(at: index)
                    shouldRepeat = true
                    break  // restart for loop from beginning
                }
            }
        } while shouldRepeat
        
        return polymerCopy
    }
        
}
