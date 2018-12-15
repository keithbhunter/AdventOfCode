//
//  Day7Tests.swift
//  AdventOfCodeTests
//
//  Created by Keith Hunter on 12/15/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import XCTest
@testable import AdventOfCode

class Day7Tests: XCTestCase {
    
    private let example = [
        "Step C must be finished before step A can begin.",
        "Step C must be finished before step F can begin.",
        "Step A must be finished before step B can begin.",
        "Step A must be finished before step D can begin.",
        "Step B must be finished before step E can begin.",
        "Step D must be finished before step E can begin.",
        "Step F must be finished before step E can begin."
    ]
    
    func testStepProcessor() {
        let steps = StepProcessor.processInstructions(example)
        XCTAssertEqual(steps.count, 6)
    }

    func testDay7Part1Example() {
        let order = Day7(input: example).determineInstructionOrder()
        XCTAssertEqual(order, "CABDFE")
    }
    
    func testDay7Part1() {
        let order = Day7().determineInstructionOrder()
        XCTAssertEqual(order, "OKBNLPHCSVWAIRDGUZEFMXYTJQ")
    }

}
