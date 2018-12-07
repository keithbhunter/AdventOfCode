//
//  Day4Tests.swift
//  AdventOfCodeTests
//
//  Created by Keith Hunter on 12/4/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Day4Tests: XCTestCase {
    
    private let exampleInput = ["[1518-11-01 00:00] Guard #10 begins shift",
                                "[1518-11-01 00:05] falls asleep",
                                "[1518-11-01 00:25] wakes up",
                                "[1518-11-01 00:30] falls asleep",
                                "[1518-11-01 00:55] wakes up",
                                "[1518-11-01 23:58] Guard #99 begins shift",
                                "[1518-11-02 00:40] falls asleep",
                                "[1518-11-02 00:50] wakes up",
                                "[1518-11-03 00:05] Guard #10 begins shift",
                                "[1518-11-03 00:24] falls asleep",
                                "[1518-11-03 00:29] wakes up",
                                "[1518-11-04 00:02] Guard #99 begins shift",
                                "[1518-11-04 00:36] falls asleep",
                                "[1518-11-04 00:46] wakes up",
                                "[1518-11-05 00:03] Guard #99 begins shift",
                                "[1518-11-05 00:45] falls asleep",
                                "[1518-11-05 00:55] wakes up"]
    
    func testDateFromInputString() {
        let calendar = Calendar(identifier: .gregorian)
        
        let date = SecurityGuardStringProcessor.date(from: "[1518-11-01 00:00] Guard #10 begins shift")
        let components = DateComponents(calendar: calendar, year: 1518, month: 11, day: 1, hour: 0, minute: 0)
        let expected = calendar.date(from: components)
        XCTAssertEqual(date, expected)
        
        let date2 = SecurityGuardStringProcessor.date(from: "[1518-11-01 00:05] falls asleep")
        let components2 = DateComponents(calendar: calendar, year: 1518, month: 11, day: 1, hour: 0, minute: 5)
        let expected2 = calendar.date(from: components2)
        XCTAssertEqual(date2, expected2)
        
        let date3 = SecurityGuardStringProcessor.date(from: "[1518-11-01 00:25] wakes up")
        let components3 = DateComponents(calendar: calendar, year: 1518, month: 11, day: 1, hour: 0, minute: 25)
        let expected3 = calendar.date(from: components3)
        XCTAssertEqual(date3, expected3)
    }
    
    func testEventFromInputString() {
        let event = SecurityGuardStringProcessor.event(from: "[1518-11-01 00:00] Guard #10 begins shift")
        let expected = SecurityGuardStringProcessor.Event.beginShift(id: 10)
        XCTAssertEqual(event, expected)
        
        let event2 = SecurityGuardStringProcessor.event(from: "[1518-11-01 00:05] falls asleep")
        let expected2 = SecurityGuardStringProcessor.Event.fallAsleep
        XCTAssertEqual(event2, expected2)
        
        let event3 = SecurityGuardStringProcessor.event(from: "[1518-11-01 00:25] wakes up")
        let expected3 = SecurityGuardStringProcessor.Event.wakeUp
        XCTAssertEqual(event3, expected3)
    }
    
    func testGenerateSecurityGuards() {
        let input = ["[1518-11-01 00:00] Guard #10 begins shift",
                     "[1518-11-01 00:05] falls asleep",
                     "[1518-11-01 00:25] wakes up"]
        
        let guards = SecurityGuardStringProcessor.generateSecurityGuards(from: input)
        
        let calendar = Calendar(identifier: .gregorian)
        let asleepComponents = DateComponents(calendar: calendar, year: 1518, month: 11, day: 1, hour: 0, minute: 5)
        let asleep = calendar.date(from: asleepComponents)!
        let wakeComponents = DateComponents(calendar: calendar, year: 1518, month: 11, day: 1, hour: 0, minute: 25)
        let wake = calendar.date(from: wakeComponents)!
        let sleepInterval = DateInterval(start: asleep, end: wake)
        
        XCTAssertEqual(guards.count, 1)
        XCTAssertEqual(guards.first!.id, 10)
        XCTAssertEqual(guards.first!.sleepIntervals.count, 1)
        XCTAssertEqual(guards.first!.sleepIntervals.first!, sleepInterval)
    }
    
    func testDay4Part1Example() {
        let day4 = Day4(events: exampleInput)
        let secGuard = day4.findGuardWhoSleepsMost()
        let minute = day4.findMinuteAsleepMost(of: secGuard)
        
        XCTAssertEqual(secGuard.id, 10)
        XCTAssertEqual(minute.minute, 24)
        XCTAssertEqual(secGuard.id * minute.minute, 240)
    }
    
    func testDay4Part1() {
        let day4 = Day4()
        let secGuard = day4.findGuardWhoSleepsMost()
        let minute = day4.findMinuteAsleepMost(of: secGuard)
        
        XCTAssertEqual(secGuard.id * minute.minute, 48680)
    }
    
    func testDay4Part2Example() {
        let answer = Day4(events: exampleInput).findMinuteAsleepMostOfAllGuards()
        XCTAssertEqual(answer.secGuard.id, 99)
        XCTAssertEqual(answer.minute, 45)
        XCTAssertEqual(answer.secGuard.id * answer.minute, 4455)
    }
    
    func testDay4Part2() {
        let answer = Day4().findMinuteAsleepMostOfAllGuards()        
        XCTAssertEqual(answer.secGuard.id * answer.minute, 94826)
    }

}
