//
//  Claim.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/3/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

struct Claim {
    
    struct Rect {
        let x, y, width, height: Int
    }
    
    let id: Int
    let frame: Rect
    
    init(string: String) {
        let symbols = CharacterSet.decimalDigits.inverted
        let components = string.components(separatedBy: symbols).compactMap { Int($0) }
        
        id = components[0]
        frame = Rect(x: components[1],
                     y: components[2],
                     width: components[3],
                     height: components[4])
    }
    
    init(id: Int, frame: Rect) {
        self.id = id
        self.frame = frame
    }
    
}

extension Claim: Equatable {
    static func ==(lhs: Claim, rhs: Claim) -> Bool {
        return lhs.id == rhs.id && lhs.frame == rhs.frame
    }
}

extension Claim.Rect: Equatable {
    static func ==(lhs: Claim.Rect, rhs: Claim.Rect) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
            && lhs.width == rhs.width
            && lhs.height == rhs.height
    }
}
