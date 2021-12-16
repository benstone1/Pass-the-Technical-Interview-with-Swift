//
//  Node.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class Node {
  var data: String
  var next: Node?
  
  init(data: String) {
    self.data = data
  }
  
  func printAllNodes(startingAt node: Node) {
    var currentNode: Node? = node
    
    while let unwrappedNode = currentNode {
      print(unwrappedNode.data)
      currentNode = unwrappedNode.next
    }
  }
  
  func printAllNodesRecursively(startingAt node: Node?) {
    guard let node = node else { return }
    print(node.data)
    printAllNodesRecursively(startingAt: node.next)
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    return data + " -> " + (next?.description ?? "nil")
  }
}
