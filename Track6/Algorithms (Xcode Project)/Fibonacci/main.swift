//
//  main.swift
//  Fibonacci
//
//  Created by John Royal on 2/28/22.
//

import Foundation

/// Functions and variables are namespaced as a workaround for a unit testing bug.
enum Fibonacci {}

extension Fibonacci {
    static var memo = [Int: Int]()
    
    static func fibonacci(_ n: Int) -> Int {
        return n > 1 ? fibonacci(n - 1) + fibonacci(n - 2) : n
    }
    
    static func fibonacciTab(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        var previous = 0
        var current = 1
        for _ in 2...n {
            let next = current + previous
            previous = current
            current = next
        }
        return current
    }

    static func fibonacciMemo(_ n: Int) -> Int {
        if let value = memo[n] {
            return value
        }
        let newValue = n > 1 ? fibonacciMemo(n - 1) + fibonacciMemo(n - 2) : n
        memo[n] = newValue
        return newValue
    }

    static let fibonacciMemoGeneric = memoize { n, fibonacci in
        return n > 1 ? fibonacci(n - 1) + fibonacci(n - 2) : n
    }
}
