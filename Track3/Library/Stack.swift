//
//  Stack.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/16/21.
//

import Foundation

/*
 class Stack {
 var stack:LinkedList?
 var size:Int
 //static final int DEFAULT_MAX_SIZE = Integer.MAX_VALUE;
 //public int maxSize;
 
 init() { // DEFAULT_MAX_SIZE
 stack = LinkedList()
 size = 0
 }
 }
 */
class Stack {
  
  var list: LinkedList?
  var size:Int
  var maximumSize:Int
  
  init(maximumSize:Int = Int.max) {
    list = LinkedList()
    size = 0
    self.maximumSize = maximumSize
  }
  
  func push(_ data:String) {
    list?.add(data)
    size += 1
    print("Added \(data)! Stack size is now \(size)")
  }
  
  func pop() -> String? {
    let node = list?.remove()
    if node != nil {
      size -= 1
    }
    print("Removed \(node?.data ?? "unknown value")! Stack size is now \(size)")
    return node?.data
  }
  
  func hasSpace() -> Bool {
    if size < maximumSize {
      return true
    }
    return false
  }
  
  func isEmpty() -> Bool {
    if size == 0 {
      return true
    }
    return false
  }
}
