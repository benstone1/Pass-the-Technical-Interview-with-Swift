//
//  main.swift
//  Knapsack
//
//  Created by John Royal on 3/14/22.


import Foundation

/// This is the “brute force” solution to the knapsack problem, with a `O(2^n)` runtime complexity.
/// - Parameters:
///   - capacity: Maximum capacity of the knapsack.
///   - weights: Array containing the weight of each item.
///   - values: Array containing the value of each item.
///   - index: Index of the item being analyzed in this specific subproblem. When calling this function initially, provide the total number of items (`weights.count` or `values.count`)—this is the highest possible index + 1.
/// - Returns: Maximum value the knapsack can contain.
func recursiveKnapsack(_ capacity: Int, _ weights: [Int], _ values: [Int], _ index: Int) -> Int {
    if index == 0 || capacity == 0 {
        return 0
    } else if weights[index - 1] > capacity {
        return recursiveKnapsack(capacity, weights, values, index - 1)
    } else {
        return max(
            recursiveKnapsack(capacity, weights, values, index - 1),
            values[index - 1] + recursiveKnapsack(capacity - weights[index - 1], weights, values, index - 1)
        )
    }
}

/// This optimized function uses tabulation, a dynamic programming strategy, to solve the knapsack problem more efficiently. This has a `O(n * m)` runtime.
/// - Parameters:
///   - capacity: Maximum capacity of the knapsack.
///   - weights: Array containing the weight of each item.
///   - values: Array containing the value of each item.
/// - Returns: Maximum value the knapsack can contain.
func optimizedKnapsack(capacity: Int, weights: [Int], values: [Int]) -> Int {
    var matrix: [[Int]] = {
        let columns = Array(repeating: 0, count: capacity + 1)
        let rows = Array(repeating: columns, count: values.count + 1)
        return rows
    }()
    
    for index in 1...values.count {
        for weight in 1...capacity {
            if weights[index - 1] > weight {
                matrix[index][weight] = matrix[index - 1][weight]
            } else {
                matrix[index][weight] = max(
                    matrix[index - 1][weight],
                    values[index - 1] + matrix[index - 1][weight - weights[index - 1]]
                )
            }
        }
    }
    
    return matrix[values.count][capacity]
}

/// This alternative implementation uses memoization, another dynamic programming strategy, to optimize the function.
/// It wasn't worth explaining in the article, but I alluded to it at the end.
/// - Parameters:
///   - capacity: Maximum capacity of the knapsack.
///   - weights: Array containing the weight of each item.
///   - values: Array containing the value of each item.
/// - Returns: Maximum value the knapsack can contain.
func memoizedKnapsack(capacity: Int, weights: [Int], values: [Int]) -> Int {
    var memo: [Subproblem: Int] = [:]
    struct Subproblem: Hashable { // dictionary keys must conform to Hashable (not possible with tuples)
        let index: Int
        let capacity: Int
        
        func next(subtractingWeight weight: Int = 0) -> Self {
            return Subproblem(index: index - 1, capacity: capacity - weight)
        }
    }
    func knapsack(_ subproblem: Subproblem) -> Int {
        if let value = memo[subproblem] {
            return value
        }
        let newValue: Int = {
            if subproblem.index == 0 || subproblem.capacity == 0 {
                return 0
            } else if weights[subproblem.index - 1] > subproblem.capacity {
                return knapsack(subproblem.next())
            } else {
                return max(
                    knapsack(subproblem.next()),
                    values[subproblem.index - 1] + knapsack(subproblem.next(subtractingWeight: weights[subproblem.index - 1]))
                )
            }
        }()
        memo[subproblem] = newValue
        return newValue
    }
    return knapsack(Subproblem(index: values.count, capacity: capacity))
}
