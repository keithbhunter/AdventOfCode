//
//  Day5Tests.swift
//  AdventOfCodeTests
//
//  Created by Keith Hunter on 12/7/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Day5Tests: XCTestCase {
    
    func testDay5Part1Example() {
        let result = Day5(input: "dabAcCaCBAcCcaDA").triggerPolymer()
        let output = "dabCBAcaDA"
        XCTAssertEqual(result, output)
    }
    
    func testDay5Part1() {
        let result = Day5().triggerPolymer()
        XCTAssertEqual(result.count, 9390)
    }
    
    func testDay5Part2Example() {
        let removingA = Day5(input: "dabAcCaCBAcCcaDA", removingPolymer: "a").triggerPolymer()
        let removingB = Day5(input: "dabAcCaCBAcCcaDA", removingPolymer: "b").triggerPolymer()
        let removingC = Day5(input: "dabAcCaCBAcCcaDA", removingPolymer: "c").triggerPolymer()
        let removingD = Day5(input: "dabAcCaCBAcCcaDA", removingPolymer: "d").triggerPolymer()
        
        XCTAssertEqual(removingA.count, 6)
        XCTAssertEqual(removingB.count, 8)
        XCTAssertEqual(removingC.count, 4)
        XCTAssertEqual(removingD.count, 6)
    }
    
    func testDay5Part2() {
        var lowestCount = Int.max
        for char in "abcdefghijklmnopqrstuvwxyz" {
            let result = Day5(removingPolymer: char).triggerPolymer()
            if result.count < lowestCount {
                lowestCount = result.count
            }
        }
        
        XCTAssertEqual(lowestCount, 0)  
    }
    
}
