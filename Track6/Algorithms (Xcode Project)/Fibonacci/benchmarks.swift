//
//  benchmarks.swift
//  FibonacciBenchmarks
//
//  Created by John Royal on 2/28/22.
//

import XCTest

@testable import Fibonacci

class FibonacciBenchmarks: XCTestCase {
    let N = 40
    let EXPECTED_NUMBER = 102334155
    
    func testFibonacci() throws {
        measure {
            XCTAssertEqual(Fibonacci.fibonacci(N), EXPECTED_NUMBER)
        }
    }

    func testFibonacciTab() throws {
        measure {
            XCTAssertEqual(Fibonacci.fibonacciTab(N), EXPECTED_NUMBER)
        }
    }

    func testFibonacciMemo() throws {
        measure {
            XCTAssertEqual(Fibonacci.fibonacciMemo(N), EXPECTED_NUMBER)
        }
    }

    func testFibonacciMemoGeneric() throws {
        measure {
            XCTAssertEqual(Fibonacci.fibonacciMemoGeneric(N), EXPECTED_NUMBER)
        }
    }
}
