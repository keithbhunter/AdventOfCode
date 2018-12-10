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
    init(removingPolymer char: Character? = nil) {
        let str = Bundle.main.string(forTextResource: "day5-input")
        let original = str.trimmingCharacters(in: .newlines)
        
        if let char = char {
            polymer = original.replacingOccurrences(of: String(char), with: "", options: .caseInsensitive)
        } else {
            polymer = original
        }
    }
    
    /// Helper init for test data injection with smaller examples.
    init(input: String, removingPolymer char: Character? = nil) {
        if let char = char {
            polymer = input.replacingOccurrences(of: String(char), with: "", options: .caseInsensitive)
        } else {
            polymer = input
        }
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
