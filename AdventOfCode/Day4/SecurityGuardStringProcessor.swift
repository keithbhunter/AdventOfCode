//
//  SecurityGuardProcessor.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/5/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

struct SecurityGuardStringProcessor {
    
    enum Event {
        case beginShift(id: Int)
        case fallAsleep
        case wakeUp
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
    
    static func generateSecurityGuards(from input: [String]) -> [SecurityGuard] {
        var guards = Set<SecurityGuard>()
        var currentGuardID: Int!
        var currentFallAsleepDate: Date!
        
        for event in processEvents(input) {
            switch event {
            case (_, .beginShift(let id)):
                currentGuardID = id
                guards.insert(SecurityGuard(id: id))
            case (let date, .fallAsleep): currentFallAsleepDate = date
            case (let date, .wakeUp):
                let current = guards.first { $0.id == currentGuardID }
                current?.sleepIntervals.append(DateInterval(start: currentFallAsleepDate, end: date))
            }
        }
        
        return guards.sorted { $0.id < $1.id }
    }
    
    static func processEvents(_ events: [String]) -> [(date: Date, event: Event)] {
        let processed: [(date: Date, event: Event)] = events.compactMap { input in
            guard let date = date(from: input),
                let event = event(from: input)
                else {
                    return nil
            }
            
            return (date, event)
        }
        
        return processed.sorted { $0.date < $1.date }
    }
    
    static func date(from input: String) -> Date? {
        let dateEndIndex = "[\(dateFormatter.dateFormat!)]".endIndex
        let dateComponent = input.prefix(upTo: dateEndIndex).trimmingCharacters(in: CharacterSet(charactersIn: "[]"))
        return dateFormatter.date(from: dateComponent)
    }
    
    static func event(from input: String) -> Event? {
        let dateEndIndex = "[\(dateFormatter.dateFormat!)]".endIndex
        let eventComponent = input.suffix(from: input.index(after: dateEndIndex))
        
        if eventComponent == "falls asleep" {
            return .fallAsleep
        } else if eventComponent == "wakes up" {
            return .wakeUp
        } else if eventComponent.hasPrefix("Guard") {
            let guardComponents = eventComponent.components(separatedBy: CharacterSet(charactersIn: "# "))
            return .beginShift(id: Int(guardComponents[2])!)
        } else {
            return nil
        }
    }
    
    private static func subtractOneMinute(from date: Date) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(minute: -1)
        return calendar.date(byAdding: components, to: date)!
    }
    
}

extension SecurityGuardStringProcessor.Event: Equatable {
    
    static func ==(lhs: SecurityGuardStringProcessor.Event, rhs: SecurityGuardStringProcessor.Event) -> Bool {
        switch (lhs, rhs) {
        case (.beginShift(let left), .beginShift(let right)): return left == right
        case (.fallAsleep, .fallAsleep): return true
        case (.wakeUp, .wakeUp): return true
        default: return false
        }
    }
    
}
