//
//  SwapNodesTest.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class SwapNodesTest: Testable {
  
  override func run() {
    
    func swapNodes(list: LinkedList, data1: Int, data2: Int) {
      
      print("Swapping \(data1) and \(data2)")
      var node1Prev: Node?
      var node2Prev: Node?
      var node1 = list.head
      var node2 = list.head
      
      if data1 == data2 {
        print("Elements are the same - no swap to be made")
        return
      }
      
      while node1 != nil {
        if node1?.data == String(data1) {
          break
        }
        node1Prev = node1
        node1 = node1?.next
      }
      
      while node2 != nil {
        if node2?.data == String(data2) {
          break
        }
        node2Prev = node2
        node2 = node2?.next
      }
      
      if node1 == nil || node2 == nil {
        print("Swap not possible - one or more element(s) are not in the list")
        return
      }
      
      if node1Prev == nil {
        list.head = node2
      } else {
        node1Prev?.next = node2
      }
      
      if node2Prev == nil {
        list.head = node1
      } else {
        node2Prev?.next = node1
      }
      
      let temp = node1?.next
      node1?.next = node2?.next
      node2?.next = temp
    }
    
    let testList = LinkedList()
    
    for i in 1...10 {
      testList.appendNode(i)
    }
    
    func swapNodes2(list: LinkedList, data1: Int, data2: Int) {
      print("Swapping \(data1) and \(data2)")
      var node1Prev: Node?
      var node2Prev: Node?
      var node1 = list.head
      var node2 = list.head
      
      if data1 == data2 {
        print("Elements are the same - no swap to be made")
        return
      }
      
      while node1 != nil {
        if node1?.data == String(data1) {
          break
        }
        node1Prev = node1
        node1 = node1?.next
      }
      
      while node2 != nil {
        if node2?.data == String(data2) {
          break
        }
        node2Prev = node2
        node2 = node2?.next
      }
      
      if node1 == nil || node2 == nil {
        print("Swap not possible - one or more elements are not in the list")
        return
      }
      
      if node1Prev == nil {
        list.head = node2
      } else {
        node1Prev?.next = node2
      }
      
      if node2Prev == nil {
        list.head = node1
      } else {
        node2Prev?.next = node1
      }
      
      let temp = node1?.next
      node1?.next = node2?.next
      node2?.next = temp
    }
    
    print(testList)
    swapNodes2(list: testList, data1: 2, data2: 5)
    print(testList)
  }
  
}
