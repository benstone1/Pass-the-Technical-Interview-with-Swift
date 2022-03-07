//
//  main.swift
//  SieveOfEratosthenes
//
//  Created by John Royal on 2/28/22.
//

import Foundation

// MARK: - Sieve of Eratosthenes

func sieveOfEratosthenes(limit: Int) -> [Int] {
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

func sieveOfEratosthenes(range: Range<Int>) -> [Int] {
    var isPrime = Dictionary(uniqueKeysWithValues: (2...range.upperBound).map { (key: $0, value: true) })
    
    let max = Int(Double(range.upperBound).squareRoot())
    
    for number in 2...max {
        for multiple in stride(from: number * 2, to: range.upperBound, by: number) where isPrime[multiple] == true {
            isPrime[multiple] = false
        }
    }
    
    return range.filter { isPrime[$0] == true }
}

// MARK: - Unoptimized Algorithms

func primeNumbers(upTo limit: Int) -> [Int] {
    return (0...limit).filter { $0.isPrime() }
}

func primeNumbers(in range: Range<Int>) -> [Int] {
    return range.filter { $0.isPrime() }
}

extension Int {
    func isPrime() -> Bool {
        guard self >= 2 else {
            return false
        }
        return !(2..<self).contains { divisor in
            self % divisor == 0
        }
    }
}
