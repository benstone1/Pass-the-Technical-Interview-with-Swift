//
//  SwapNodesTest.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class ArticleSwappingElementsInALinkedList: Testable {
  
  override func run() {
    
    func swapNodes(of list: LinkedList, at index1: Int, and index2: Int) {

      print("Swapping \(index1) and \(index2)")
      var node1Prev: Node?
      var node2Prev: Node?
      var node1: Node?
      var node2: Node?

      if index1 == index2 {
        print("Element indices are the same - no swap to be made")
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
    swapNodes(of: testList1, at: 2, and: 4)
    print(testList1)
    print("tail is \(String(describing: testList1.tail!)) head is \(String(describing: testList1.head!))")
    
    print(testList2)
    swapNodes(of: testList2, at: 0, and: 5)
    print(testList2)
    print("tail is \(String(describing: testList2.tail!)) head is \(String(describing: testList2.head!))")
    
    print(testList3)
    swapNodes(of: testList3, at: 2, and: 9)
    print(testList3)
    print("tail is \(String(describing: testList3.tail!)) head is \(String(describing: testList3.head!))")
    
    print("edge case not covered")
    print(testList4)
    print("tail is \(String(describing: testList4.tail!)) head is \(String(describing: testList4.head!))")
    swapNodes(of: testList4, at: 4, and: 0)
    print(testList4)
    print("tail is \(String(describing: testList4.tail!))")
  }
}
