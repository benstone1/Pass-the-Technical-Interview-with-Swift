//
//  benchmarks.swift
//  CapturingRainwaterBenchmarks
//
//  Created by John Royal on 2/28/22.
//

import XCTest

class CapturingRainwaterBenchmarks: XCTestCase {
    let INPUT = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
    let EXPECTED_OUTPUT = 6
    
    func testBruteForceSolution() throws {
        measure {
            XCTAssertEqual(bruteForceSolution(INPUT), EXPECTED_OUTPUT)
        }
    }
    
    func testDynamicProgrammingSolution() throws {
        measure {
            XCTAssertEqual(dynamicProgrammingSolution(INPUT), EXPECTED_OUTPUT)
        }
    }

    func testTwoPointersSolution() throws {
        measure {
            XCTAssertEqual(twoPointersSolution(INPUT), EXPECTED_OUTPUT)
        }
    }
}
