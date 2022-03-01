//
//  memoize.swift
//  Fibonacci
//
//  Created by John Royal on 2/28/22.
//

import Foundation

func memoize<Input: Hashable, Output>(operation: @escaping (Input, @escaping (Input) -> Output) -> Output) -> (Input) -> Output {
    var memo: [Input: Output] = [:]
    
    func memoizedFunction(_ input: Input) -> Output {
        if let value = memo[input] {
            return value
        }
        let newValue = operation(input, memoizedFunction(_:))
        memo[input] = newValue
        return newValue
    }
    
    return memoizedFunction(_:)
}
