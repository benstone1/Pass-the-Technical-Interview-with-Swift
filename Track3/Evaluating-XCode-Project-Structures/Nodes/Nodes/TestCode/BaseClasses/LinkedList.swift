//
//  LinkedList.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class LinkedList {
  var head: Node?
  var tail: Node?
  
  func appendNode(_ data: String) {
    let newNode = Node(data: data)
    if let lastNode = tail {
      lastNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
  }
  
  func getNode(at index: Int) -> Node? {
    guard index >= 0 else { return nil }
    var current = head
    
    for _ in 0..<index {
      guard let next = current?.next else { return nil }
      current = next
    }
    return current
  }
  
  func removeNode(from index: Int) -> Node? {
    var removedNode: Node?
    guard index >= 0 else { return nil }
    if index == 0 {
      removedNode = head
      head = head?.next
      if head == nil {
        tail = nil
      }
      return removedNode
    }
    guard let previous = getNode(at: index - 1) else { return nil }
    removedNode = previous.next
    if removedNode?.next == nil {
      tail = previous
    }
    previous.next = removedNode?.next
    return removedNode
  }
}

extension LinkedList: CustomStringConvertible {
  /*  var description: String {
   return head?.description ?? "nil"
   }
   */
  var description: String {
    var nodes = ""
    var node = head
    while node != nil {
      nodes += "\(node!.data) "
      node = node!.next
    }
    return nodes
  }
}
