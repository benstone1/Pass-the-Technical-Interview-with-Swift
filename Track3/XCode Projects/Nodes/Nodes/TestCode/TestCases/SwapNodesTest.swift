//
//  SwapNodesTest.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class SwapNodesTest: Testable {
  
  override func run() {
    
    func swapNodes(list: LinkedList, index1: Int, index2: Int) {
      
      print("Swapping \(index1) and \(index2)")
      var node1Prev: Node?
      var node2Prev: Node?
      var node1 = list.head
      var node2 = list.head
      
      if index1 == index2 {
        print("Element indicies are the same - no swap to be made")
        return
      }
      
      node1 = list.getNode(at: index1)
      node2 = list.getNode(at: index2)
      
      if node1 == nil || node2 == nil {
        print("Swap not possible - one or more elements are not in the list")
        return
      }
      
      if index1 > 0 {
        node1Prev = list.getNode(at: index1 - 1)
      }
      if index2 > 0 {
        node2Prev = list.getNode(at: index2 - 1)
      }
      
      node1Prev?.next = node2
      node2Prev?.next = node1
      let tempNode = node1?.next
      node1?.next = node2?.next
      
      if node1Prev == nil {
        list.head = node2
      }
      
      if node2?.next == nil {
        list.tail = node1
      }
      
      node2?.next = tempNode
      
    }
    
    let testList1 = LinkedList()
    let testList2 = LinkedList()
    let testList3 = LinkedList()
    let testList4 = LinkedList()
    for i in 1...10 {
      testList1.append(String(i))
      testList2.append(String(i))
      testList3.append(String(i))
      testList4.append(String(i))
    }
    print(testList1)
    swapNodes(list: testList1, index1: 2, index2: 5)
    print(testList1)
    print("tail is \(String(describing: testList1.tail!)) head is \(String(describing: testList1.head!))")
    
    print(testList2)
    swapNodes(list: testList2, index1: 0, index2: 5)
    print(testList2)
    print("tail is \(String(describing: testList2.tail!)) head is \(String(describing: testList2.head!))")
    
    print(testList3)
    swapNodes(list: testList3, index1: 2, index2: 9)
    print(testList3)
    print("tail is \(String(describing: testList3.tail!)) head is \(String(describing: testList3.head!))")
    
    print("edge case not covered")
    print(testList4)
    print("tail is \(String(describing: testList4.tail!)) head is \(String(describing: testList4.head!))")
    swapNodes(list: testList4, index1: 4, index2: 0)
    print(testList4)
    print("tail is \(String(describing: testList4.tail!))")
  }
}
