//
//  Day1Tests.swift
//  AdventOfCodeTests
//
//  Created by Keith Hunter on 12/2/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Day1Tests: XCTestCase {

    func testDay1Part1() {
        XCTAssertEqual(Day1().resultingFrequencyAfterAllChanges(), 543)
    }
    
    func testDay1Part2() {
        XCTAssertEqual(Day1().firstFrequencyToOccurTwice(), 621)
    }

}
