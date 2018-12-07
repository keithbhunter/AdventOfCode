//
//  Day4.swift.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/4/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

class Day4 {
    
    private let guards: [SecurityGuard]
    
    /// Inits with the input data for AOC.
    init() {
        let str = Bundle.main.string(forTextResource: "day4-input")
        let events = str.components(separatedBy: "\n")
        let sorted = events.sorted {
            SecurityGuardStringProcessor.date(from: $0)! < SecurityGuardStringProcessor.date(from: $1)!
        }
        
        guards = SecurityGuardStringProcessor.generateSecurityGuards(from: sorted)
    }
    
    /// Helper init for test data injection with smaller examples.
    init(events: [String]) {
        let sorted = events.sorted {
            SecurityGuardStringProcessor.date(from: $0)! < SecurityGuardStringProcessor.date(from: $1)!
        }
        
        guards = SecurityGuardStringProcessor.generateSecurityGuards(from: sorted)
    }
    
    func findGuardWhoSleepsMost() -> SecurityGuard {
        return guards.sorted {
            $0.sleepIntervals.reduce(0, { $0 + $1.duration }) > $1.sleepIntervals.reduce(0, { $0 + $1.duration })
        }.first!
    }
    
    func findMinuteAsleepMost(of secGuard: SecurityGuard) -> (minute: Int, count: Int) {
        var minuteCounts = [Int](repeating: 0, count: 60)
        
        for interval in secGuard.sleepIntervals {
            let startMin = Calendar(identifier: .gregorian).dateComponents([.minute], from: interval.start).minute!
            let endMin = Calendar(identifier: .gregorian).dateComponents([.minute], from: interval.end).minute!
            
            for min in startMin ..< endMin {
                minuteCounts[min] = minuteCounts[min] + 1
            }
        }
        
        let count = minuteCounts.max()!
        return (minute: minuteCounts.firstIndex(of: count)!, count: count)
    }
    
    func findMinuteAsleepMostOfAllGuards() -> (secGuard: SecurityGuard, minute: Int) {
        let minutes = guards.map { findMinuteAsleepMost(of: $0) }
        let guardAndMinutes = zip(guards, minutes).sorted(by: { $0.1.count > $1.1.count }).first!
        return (secGuard: guardAndMinutes.0, minute: guardAndMinutes.1.minute)
    }
    
}
