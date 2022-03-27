//
//  benchmarks.swift
//  KnapsackBenchmarks
//
//  Created by John Royal on 3/17/22.
//

import XCTest

class KnapsackBenchmarks: XCTestCase {
    let CAPACITY = 750
    let WEIGHTS = [134, 146, 85, 150, 115, 111, 137, 109, 129, 126, 99, 147, 99, 142, 118, 147, 125, 120, 100, 100, 131, 94, 95, 148, 98, 133, 87, 92, 99, 148, 77, 95]
    let VALUES = [204, 257, 168, 211, 235, 167, 280, 107, 174, 248, 122, 142, 240, 241, 139, 126, 110, 202, 277, 280, 123, 283, 120, 136, 205, 200, 295, 184, 149, 209, 245, 138]
    let EXPECTED_OUTPUT = 2009
    
    func testRecursiveKnapsack() throws {
        measure {
            XCTAssertEqual(recursiveKnapsack(CAPACITY, WEIGHTS, VALUES, VALUES.count), EXPECTED_OUTPUT)
        }
    }
    
    func testOptimizedKnapsack() throws {
        measure {
            XCTAssertEqual(optimizedKnapsack(capacity: CAPACITY, weights: WEIGHTS, values: VALUES), EXPECTED_OUTPUT)
        }
    }
    
    func testMemoizedKnapsack() throws {
        measure {
            XCTAssertEqual(memoizedKnapsack(capacity: CAPACITY, weights: WEIGHTS, values: VALUES), EXPECTED_OUTPUT)
        }
    }
}
