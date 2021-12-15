//
//  BasicNodesTest.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/15/21.
//

import Foundation

class BasicNodesTest : Testable {
  
  override func run() {
    let nodeOne = Node(data: "Node 1")
    let nodeTwo = Node(data: "Node 2")
    let nodeThree = Node(data: "Node 3")
    nodeOne.next = nodeTwo
    nodeTwo.next = nodeThree
    
    print(nodeTwo.description) // Prints: Node 2 -> Node 3 -> nil
    print(nodeOne.description) // Prints: Node 1 -> Node 2 -> Node 3 -> nil
  }
}
