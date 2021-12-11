// Code from Previous Lesson: 
class Node {
    var data: String
    var next: Node?
    
    init(data: String) {
        self.data = data
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

    // New Code for this Exercise: 
    func getNode(at index: Int) -> Node? {
        guard index >= 0 else { return nil }
        var current = head
        
        for _ in 0..<index {
            guard let next = current?.next else { return nil }
            current = next
        }
        return current
    }

}

extension LinkedList: CustomStringConvertible {

    var description: String {
        return head?.description ?? "nil"
    }
}

    