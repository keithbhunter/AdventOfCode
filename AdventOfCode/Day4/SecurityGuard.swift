//
//  SecurityGuard.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/4/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

class SecurityGuard {
    
    let id: Int
    var sleepIntervals = [DateInterval]()
    
    init(id: Int) {
        self.id = id
    }
    
}

extension SecurityGuard: Hashable {
    
    var hashValue: Int { return id.hashValue }
    
    static func == (lhs: SecurityGuard, rhs: SecurityGuard) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}
