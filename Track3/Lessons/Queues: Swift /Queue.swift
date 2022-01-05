class Node {
    var data: String
    var next: Node?

    init(data: String) {
        self.data = data
    }
}

struct Queue {
  var head: Node?
  var tail: Node?

  mutating func enqueue(_ data: String) {
    let newNode = Node(data: data)

    guard let lastNode = tail else {
      head = newNode
      tail = newNode
      return
  }

    lastNode.next = newNode
    tail = newNode
  }

  mutating func peek() -> String? {
    return head?.data
  }

  mutating func dequeue() -> String? {
    var removedNode: String?

    if let firstNode = head {
      removedNode = firstNode.data
    } 

    head = head?.next 
    return removedNode 
  }
}