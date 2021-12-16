//
//  Queue.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/15/21.
//

import Foundation

class Queue {
  var head: Node?
  var tail: Node?
  
  init() {
    head = nil
    tail = nil
  }
  
  func enqueue(item: String) {
    
    let newNode:Node = Node(data: item)
    
    if head == nil {
      head = newNode
      tail = head
      return
    }
    
    tail!.next = newNode
    tail = newNode
  }
  
  func dequeue() -> String? {
    
    let topItem: String? = head?.data
    
    if head!.next != nil {
      head = head!.next
    } else {
      head = nil
      tail = nil
    }
    
    return topItem
  }
  
  func peek() -> String? {
    return head?.data
  }
}

extension Queue: CustomStringConvertible {

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
