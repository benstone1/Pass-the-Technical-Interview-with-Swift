//
//  main.swift
//  CapturingRainwater
//
//  Created by John Royal on 3/3/22.
//

import Foundation

func bruteForceSolution(_ heights: [Int]) -> Int {
    var totalWater = 0
    
    for i in heights.indices {
        let leftBound = heights[0...i].max()!
        let rightBound = heights[i...].max()!
        totalWater += min(leftBound, rightBound) - heights[i]
    }
    
    return totalWater
}

func dynamicProgrammingSolution(_ heights: [Int]) -> Int {
    var totalWater = 0
    var leftMax = 0
    var rightMax = 0
    var leftBounds = Array(repeating: 0, count: heights.count)
    var rightBounds = Array(repeating: 0, count: heights.count)
    
    for i in heights.indices {
        leftMax = max(leftMax, heights[i])
        leftBounds[i] = leftMax
    }
    
    for i in heights.indices.reversed() {
        rightMax = max(rightMax, heights[i])
        rightBounds[i] = rightMax
    }
    
    for i in heights.indices {
        totalWater += min(leftBounds[i], rightBounds[i]) - heights[i]
    }
    
    return totalWater
}

func twoPointersSolution(_ heights: [Int]) -> Int {
    var totalWater = 0
    var leftPointer = 0
    var rightPointer = heights.count - 1
    var leftBound = 0
    var rightBound = 0
    
    while leftPointer < rightPointer {
        let leftElement = heights[leftPointer]
        let rightElement = heights[rightPointer]
        
        if leftElement < rightElement {
            leftBound = max(leftBound, leftElement)
            totalWater += leftBound - leftElement
            leftPointer += 1
        } else {
            rightBound = max(rightBound, rightElement)
            totalWater += rightBound - rightElement
            rightPointer -= 1
        }
    }
    
    return totalWater
}
