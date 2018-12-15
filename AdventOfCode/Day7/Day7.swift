//
//  Day7.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/15/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

class Day7 {
    
    private let steps: Set<Step>
    
    init() {
        let str = Bundle.main.string(forTextResource: "day7-input")
        let lines = str.components(separatedBy: "\n")
        steps = Set(StepProcessor.processInstructions(lines))
    }
    
    init(input: [String]) {
        steps = Set(StepProcessor.processInstructions(input))
    }
    
    func determineInstructionOrder() -> String {
        var order = ""
        var copy = steps
        
        while !copy.isEmpty {
            let step = copy
                .sorted(by: { $0.letter < $1.letter })
                .first(where: { $0.dependencies.isEmpty })!
            order.append(step.letter)
            
            for var subsequentStep in copy {
                if let index = subsequentStep.dependencies.firstIndex(of: step) {
                    subsequentStep.dependencies.remove(at: index)
                }
                copy.update(with: subsequentStep)
            }
            
            copy.remove(step)
        }
        
        return order
    }
    
}

struct StepProcessor {
    
    static func processInstructions(_ instructions: [String]) -> [Step] {
        var steps = [Character : Step]()
        
        for var instruction in instructions {
            instruction = instruction.replacingOccurrences(of: "Step ", with: "")
            instruction = instruction.replacingOccurrences(of: " must be finished before step ", with: "")
            instruction = instruction.replacingOccurrences(of: " can begin.", with: "")
            let letters = instruction.map { $0 }
            assert(letters.count == 2)
            
            if steps[letters[0]] == nil {
                steps[letters[0]] = Step(letter: letters[0], dependencies: [])
            }
            
            if var step = steps[letters[1]] {
                step.dependencies.append(steps[letters[0]]!)
                steps[letters[1]] = step
            } else {
                let step = Step(letter: letters[1], dependencies: [steps[letters[0]]!])
                steps[letters[1]] = step
            }
        }
        
        return steps.values.sorted(by: { $0.dependencies.count < $1.dependencies.count })
    }
    
}

struct Step: Hashable {
    
    let letter: Character
    var dependencies: [Step]
    var hashValue: Int { return letter.hashValue }
    
    static func ==(lhs: Step, rhs: Step) -> Bool {
        return lhs.letter == rhs.letter
    }
    
}
