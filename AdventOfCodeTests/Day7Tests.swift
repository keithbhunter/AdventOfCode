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
        let day7 = Day7(input: example)
        day7.numberOfWorkers = 2
        let order = day7.determineInstructionOrder()
        XCTAssertEqual(order, "CABDFE")
    }
    
    func testDay7Part1() {
        let order = Day7().determineInstructionOrder()
        XCTAssertEqual(order, "OKBNLPHCSVWAIRDGUZEFMXYTJQ")
    }
    
    // Measure the time this test takes
    func testDay7Part2Example() {
        StepOperation.executionDelay = 0
        let day7 = Day7(input: example)
        day7.numberOfWorkers = 2
        let exp = expectation(description: "testDay7Part1Example2")
        
        day7.determineInstructionOrder2() {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 30) { (error) in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }
    
    // Measure the time this test takes
    func testDay7Part2() {
        StepOperation.executionDelay = 60
        let day7 = Day7()
        day7.numberOfWorkers = 5
        let exp = expectation(description: "testDay7Part1Example2")
        
        day7.determineInstructionOrder2() {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 100000) { (error) in
            if let error = error {
                XCTFail("\(error)")
            }
        }
    }

}
