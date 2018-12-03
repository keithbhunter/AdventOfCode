//
//  Day2Tests.swift
//  AdventOfCodeTests
//
//  Created by Keith Hunter on 12/3/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Day2Tests: XCTestCase {

    func testDay2Part1Example() {
        let checksum = Day2(ids: ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"]).calculateChecksum()
        XCTAssertEqual(checksum, 12)
    }
    
    func testDay2Part1() {
        let checksum = Day2().calculateChecksum()
        XCTAssertEqual(checksum, 5750)
    }
    
    func testDay2Part2Example() {
        let chars = Day2(ids: ["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"]).findIDsWithOneCharacterDifference()
        XCTAssertEqual(chars, "fgij")
    }
    
    func testDay2Part2() {
        let chars = Day2().findIDsWithOneCharacterDifference()
        XCTAssertEqual(chars, "tzyvunogzariwkpcbdewmjhxi")
    }

}
