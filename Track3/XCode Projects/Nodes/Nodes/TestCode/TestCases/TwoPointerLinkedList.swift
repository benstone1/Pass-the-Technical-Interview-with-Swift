//
//  TwoPointerLinkedList.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class TwoPointerLinkedList : Testable {
  
  func getNode(from list:LinkedList, at n:Int) -> Node? {
    var linkedListArray = [Node?]()
    var currentNode = list.head
    while currentNode != nil {
      linkedListArray.append(currentNode!)
      currentNode = currentNode!.next
    }
    return linkedListArray[n-1];
  }
  
  func getNode2(from list:LinkedList, at n:Int) -> Node? {
    var current:Node? = nil
    var tailSeeker = list.head
    var count = 0
    while (tailSeeker != nil) {
      if count == n - 1 {
        current = tailSeeker
        break
      }
      tailSeeker = tailSeeker!.next
      count += 1
    }
    return current!
  }
  
  func getMiddleNode(from list:LinkedList) -> Node? {
    var fast = list.head
    var slow = list.head
    
    while (fast != nil) {
      fast = fast?.next
      if (fast != nil) {
        fast = fast?.next
        slow = slow?.next
      }
    }
    return slow
  }
  
  func getMiddleNode2(from list:LinkedList) -> Node? {
    var count = 0
    var fast = list.head
    var slow = list.head
    
    while (fast != nil) {
      fast = fast?.next
      if (count % 2 != 0) {
        slow = slow?.next
      }
      count += 1
    }
    return slow
  }
  
  override func run() {
    let testList = LinkedList()
    let testList2 = LinkedList()
    
    for i in 1...10 {
      testList.append( String(i*100) );
    }
    for i in 1...5 {
      testList2.append( String(i*100) );
    }
    let nthPosition = 8
    let nthPositionNodeSpace:Node? = getNode(from: testList, at:nthPosition)
    let nthPositionNodeTime:Node? = getNode2(from: testList, at:nthPosition)
    print("O(n) Space - data in the node at the \(nthPosition) is \(nthPositionNodeSpace?.data ?? "unknown")")
    print("O(n) Time - Data in the node at the \(nthPosition) is \(nthPositionNodeTime?.data ?? "unknown")")
    
    print("middle of the list is \(getMiddleNode(from: testList2)?.data ?? "unknown")")
    print("middle of the list is \(getMiddleNode2(from: testList2)?.data ?? "unknown")")

  }
}
