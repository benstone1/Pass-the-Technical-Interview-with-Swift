class Node {
    var data: String
    var next: Node?
    var previous: Node? // New Property 
  
    init(data: String) {
        self.data = data
    }
}

// Updated Extension 
extension Node: CustomStringConvertible {
    var description: String {
      let leadingNil = "\(previous == nil ? "nil <- " : "")"
      let arrow = " \(next != nil ? "<" : "")-> "
      let nextDescription = next?.description ?? "nil"
      return leadingNil + data + arrow + nextDescription
    }
}

class DoublyLinkedList { // Updated Class Name
    var head: Node?
    var tail: Node?
    
     func append(_ data: String) {
        let newNode = Node(data: data)

        if let lastNode = tail {
	        newNode.previous = lastNode // New Code 
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

    // New Function 
    func removeFirstNode() -> Node? { 
      let removedHead = head                     
          head = head?.next
          head?.previous = nil
          if head == nil {
              tail = nil
          }
          removedHead?.next = nil
          return removedHead
      }

    // Updated Function                               
    func removeNode(at index: Int) -> Node? {
        guard index >= 0 else { return nil }
      
        if index == 0 {
          return removeFirstNode()
        }
       
        guard let nodeToRemove = getNode(at: index) else { return nil }
       
        if nodeToRemove.next == nil {
            tail = nodeToRemove.previous
            tail?.next = nil
        } 

        let nextNode = nodeToRemove.next
        let previousNode = nodeToRemove.previous

        nextNode?.previous = previousNode
        previousNode?.next = nextNode

        nodeToRemove.next = nil
        nodeToRemove.previous = nil
        
        return nodeToRemove 
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        return head?.description ?? "nil"
    }
}
