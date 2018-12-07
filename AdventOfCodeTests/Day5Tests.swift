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
    
}
