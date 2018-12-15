//
//  Day6.swift
//  AdventOfCode
//
//  Created by Keith Hunter on 12/11/18.
//  Copyright © 2018 Keith Hunter. All rights reserved.
//

import Foundation

struct Point: Hashable, CustomStringConvertible {
    
    var x: Int
    var y: Int
    
    var description: String { return "(\(x),\(y))" }
    
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
    
    init() {
        let str = Bundle.main.string(forTextResource: "day6-input")
        let lines = str.components(separatedBy: "\n")
        
        points = lines.map { line in
            let components = line.components(separatedBy: ", ")
            return Point(Int(components[0])!, Int(components[1])!)
        }
    }
    
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
    
    func calculateClosestPoints(padding: Int = 0) -> [Point : Point] {
        let box = boundingBox()
        var closestPoints = [Point : Point]()
        
        for x in box.min.x - padding ... box.max.x + padding {
            for y in box.min.y - padding ... box.max.y + padding {
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
        
        return closestPoints
    }
    
    func largestFiniteArea() -> (point: Point, area: Int) {
        var closestPoints = calculateClosestPoints()
        var closestPointsPadded = calculateClosestPoints(padding: 10)
        
        var pointOfInterest: Point!
        var largestArea = 0
        for point in finitePoints() {
            let area = closestPoints.values.filter { $0 == point }.count
            let areaWithPadding = closestPointsPadded.values.filter { $0 == point }.count
            
            if area == areaWithPadding && area > largestArea {
                largestArea = area
                pointOfInterest = point
            }
        }
        
        return (pointOfInterest, largestArea)
    }
    
    func calculateManhattanSum(of point: Point) -> Int {
        return points.reduce(0, { $0 + $1.manhattanDistance(to: point) })
    }
    
    func findPoints(withinDistance distance: Int) -> [Point] {
        let box = boundingBox()
        var points = [Point]()
        
        for x in box.min.x ... box.max.x {
            for y in box.min.y ... box.max.y {
                let pt = Point(x, y)
                
                if calculateManhattanSum(of: pt) < distance {
                    points.append(pt)
                }
            }
        }
        
        return points
    }
    
}
