//
//  Bundle+AOC.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/3/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

extension Bundle {
    
    func string(forTextResource resource: String) -> String {
        let url = Bundle.main.url(forResource: resource, withExtension: "txt")!
        let data = try! Data(contentsOf: url)
        return String(data: data, encoding: .utf8)!.trimmingCharacters(in: .newlines)
    }
    
}
