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

class LinkedList {
  var head: Node?
  var tail: Node?
  
  func append(_ data: String) {
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

extension LinkedList {
  func add(_ data: String) {
    let newHead = Node(data: data)
    let current = head
    head = newHead
    if current != nil {
      head?.next = current
    }
  }
  
  func remove() -> Node? {
    let removedHead = head
    if removedHead != nil {
      head = removedHead?.next
      removedHead?.next = nil
    }
    return removedHead
  }
}

extension LinkedList: CustomStringConvertible {
  var description: String {
    return head?.description ?? "nil"
  }
}

class Stack {
  
  var list: LinkedList?
  var size:Int
  var maximumSize:Int
  init(maximumSize:Int = Int.max) {
    list = LinkedList()
    size = 0
    self.maximumSize = maximumSize
  } 
}
let list = Stack()
print("This stack has \(list.size) nodes.")

