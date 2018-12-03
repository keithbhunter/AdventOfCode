//
//  Bundle+AOC.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/3/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

extension Bundle {
    
    func data(forTextResource resource: String) -> Data {
        let url = Bundle.main.url(forResource: resource, withExtension: "txt")!
        return try! Data(contentsOf: url)
    }
    
}
