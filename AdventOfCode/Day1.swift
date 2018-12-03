//
//  Day1.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/2/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

struct Day1 {
    
    static func calculateFrequency() {
        let url = Bundle.main.url(forResource: "input", withExtension: "txt")!
        let data = try! Data(contentsOf: url)
        let str = String(data: data, encoding: .utf8)
        let components = str!.components(separatedBy: "\n")
        
        var total = 0
        for number in components {
            total += Int(number) ?? 0
        }
        print(total)
    }
    
}
