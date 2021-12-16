//
//  BasicQueueTest.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/15/21.
//

import Foundation

class BasicQueueTest : Testable {
  
  override func run() {
    let queue = Queue()
    queue.enqueue(item: "x")
    queue.enqueue(item: "y")
    queue.enqueue(item: "z")
    
    // a queue is a fifo, get to the store as the first customer, you are the first one served
    print(queue.peek()!) // Prints: x
    print(queue) // Prints: x -> y -> z
    print(queue.dequeue()!) // Prints: x
    print(queue.dequeue()!) // Prints: y
  }
}
