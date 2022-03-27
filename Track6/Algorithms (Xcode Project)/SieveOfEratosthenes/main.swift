//
//  main.swift
//  SieveOfEratosthenes
//
//  Created by John Royal on 2/28/22.
//

import Foundation

/// Returns all prime numbers between 0 and the given `limit`.
/// This is the naive implementation.
func naivePrimeNumbers(upTo limit: Int) -> [Int] {
    return (0...limit).filter { number in
        guard number > 1 else {
            return false
        }
        return !(2..<number).contains { number % $0 == 0 }
    }
}

/// Returns all prime numbers between 0 and the given `limit`.
/// This optimized implementation uses the Sieve of Eratosthenes algorithm.
func primeNumbers(upTo limit: Int) -> [Int] {
    var isPrime = Array(repeating: true, count: limit)
    isPrime[0] = false
    isPrime[1] = false
    
    let max = Int(Double(limit).squareRoot())
    
    for number in 2...max {
        for multiple in stride(from: number * 2, to: limit, by: number) where isPrime[multiple] {
            isPrime[multiple] = false
        }
    }
    
    return isPrime.indices.filter { isPrime[$0] }
}
