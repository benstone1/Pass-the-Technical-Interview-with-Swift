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
  
  func appendNode(_ data: Int) {
    appendNode("\(data)")
  }
  
  func appendNode(_ data: String) {
    let newNode = Node(data: data)
    if let lastNode = tail {
      lastNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
  }
}

extension LinkedList: CustomStringConvertible {
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
