//
//  AsyncOperation.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/15/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

class AsyncOperation: Operation {
    
    override var isAsynchronous: Bool {
        return true
    }
    
    var _isFinished: Bool = false
    
    override var isFinished: Bool {
        get { return _isFinished }
        set {
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    var _isExecuting: Bool = false
    
    override var isExecuting: Bool {
        get { return _isExecuting }
        set {
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    func execute() {}
    
    override func start() {
        isExecuting = true
        execute()
    }
    
    func finish() {
        isExecuting = false
        isFinished = true
    }
    
}
