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
}

// New Code for this Exercise: 
extension LinkedList: CustomStringConvertible {

    var description: String {
        return head?.description ?? "nil"
    }
}

    