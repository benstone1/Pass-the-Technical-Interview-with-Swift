//
//  TwoPointerLinkedList.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class TwoPointerLinkedList : Testable {
  
  func arrayNthLast(list:LinkedList, n:Int) -> Node {
    var linkedListArray = [Node]()
    var currentNode = list.head
    while currentNode != nil {
      linkedListArray.append(currentNode!)
      currentNode = currentNode!.next
    }
    return linkedListArray[n-1];
  }
  
  func nthLastNode(list:LinkedList, n:Int) -> Node {
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
  
  override func run() {
    let testList = LinkedList()
    
    for i in 1...10 {
      testList.appendNode(i*100);
    }
    let nthPosition = 8
    let nthPositionNodeSpace:Node = arrayNthLast(list:testList, n:nthPosition)
    let nthPositionNodeTime:Node = nthLastNode(list:testList, n:nthPosition)
    print("O(n) Space - data in the node at the \(nthPosition) is \(nthPositionNodeSpace.data)")
    print("O(n) Time - Data in the node at the \(nthPosition) is \(nthPositionNodeTime.data)")
  }
}
