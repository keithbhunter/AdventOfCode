//
//  Day3Tests.swift
//  AdventOfCodeTests
//
//  Created by Keith Hunter on 12/3/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Day3Tests: XCTestCase {
    
    func testClaimInit() {
        XCTAssertEqual(Claim(string: "#123 @ 3,2: 5x4"), Claim(id: 123, frame: Claim.Rect(x: 3, y: 2, width: 5, height: 4)))
    }
    
    func testDay3Part1Example() {
        let inchesWithMultipleClaims = Day3(claims: ["#1 @ 1,3: 4x4", "#2 @ 3,1: 4x4", "#3 @ 5,5: 2x2"]).findContestedSquareInches()
        XCTAssertEqual(inchesWithMultipleClaims, 4)
    }
    
    func testDay3Part1() {
        let inchesWithMultipleClaims = Day3().findContestedSquareInches()
        XCTAssertEqual(inchesWithMultipleClaims, 101469)
    }
    
    func testDay3Part2() {
        let claim = Day3().findUncontestedClaim()
        XCTAssertEqual(claim!.id, 1067)
    }

}
