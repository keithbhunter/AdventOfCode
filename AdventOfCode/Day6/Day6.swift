//
//  Day6.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/11/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

struct Point: Hashable {
    
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    func manhattanDistance(to point: Point) -> Int {
        return abs(x - point.x) + abs(y - point.y)
    }
    
}

class Day6 {
    
    private let points: [Point]
    
    init(input: [Point]) {
        points = input
    }
    
    func finitePoints() -> [Point] {
        var finitePoints = [Point]()
        
        for point in points {
            var pointToLeft = false
            var pointToRight = false
            var pointToTop = false
            var pointToBottom = false
            
            for otherPoint in points {
                if otherPoint.x < point.x { pointToLeft = true }
                if otherPoint.x > point.x { pointToRight = true }
                if otherPoint.y < point.y { pointToTop = true }
                if otherPoint.y > point.y { pointToBottom = true }
            }
            
            if pointToLeft && pointToRight && pointToTop && pointToBottom {
                finitePoints.append(point)
            }
        }
        
        return finitePoints
    }
    
    func boundingBox() -> (min: Point, max: Point) {
        var minX: Int = points[0].x
        var minY: Int = points[0].y
        var maxX: Int = points[0].x
        var maxY: Int = points[0].y
        
        for point in points.dropFirst() {
            if point.x < minX { minX = point.x }
            if point.y < minY { minY = point.y }
            if point.x > maxX { maxX = point.x }
            if point.y > maxY { maxY = point.y }
        }
        
        return (Point(minX, minY), Point(maxX, maxY))
    }
    
    func largestFiniteArea() -> Int {
        let box = boundingBox()
        var closestPoints = [Point : Point]()
        
        for x in box.min.x ... box.max.x {
            for y in box.min.y ... box.max.y {
                let point = Point(x, y)
                let distances = points.map { $0.manhattanDistance(to: point) }
                
                let shortestDistance = distances.min()!
                let firstIndex = distances.firstIndex(of: shortestDistance)!
                let lastIndex = distances.lastIndex(of: shortestDistance)!
                
                var closestPoint: Point?
                if firstIndex == lastIndex {
                    closestPoint = points[firstIndex]
                }
                closestPoints[point] = closestPoint
            }
        }
        
        var largestArea = 0
        for point in finitePoints() {
            let area = closestPoints.values.filter { $0 == point }.count
            if area > largestArea { largestArea = area }
        }
        
        return largestArea
    }
    
}
