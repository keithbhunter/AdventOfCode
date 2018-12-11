//
//  Day6Tests.swift
//  AdventOfCodeTests
//
//  Created by Keith Hunter on 12/11/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Day6Tests: XCTestCase {
    
    func testDay6FindFiniteLetters() {
        let a = Point(1, 1)
        let b = Point(1, 6)
        let c = Point(8, 3)
        let d = Point(3, 4)
        let e = Point(5, 5)
        let f = Point(8, 9)
        
        let finitePoints = Day6(input: [a, b, c, d, e, f]).finitePoints()
        XCTAssertEqual(Set(finitePoints), Set([e, d]))
    }
    
    func testDay6BoundingBox() {
        let a = Point(1, 1)
        let b = Point(1, 6)
        let c = Point(8, 3)
        let d = Point(3, 4)
        let e = Point(5, 5)
        let f = Point(8, 9)
        
        let box = Day6(input: [a, b, c, d, e, f]).boundingBox()
        let expected = (min: Point(1, 1), max: Point(8, 9))
        XCTAssertEqual(box.min, expected.min)
        XCTAssertEqual(box.max, expected.max)
    }
    
    func testDay6Part1Example() {
        let a = Point(1, 1)
        let b = Point(1, 6)
        let c = Point(8, 3)
        let d = Point(3, 4)
        let e = Point(5, 5)
        let f = Point(8, 9)
        
        let area = Day6(input: [a, b, c, d, e, f]).largestFiniteArea()
        XCTAssertEqual(area, 17)
    }
    
}
