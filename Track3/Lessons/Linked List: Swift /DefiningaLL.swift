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

// New Code for this Exercise: 

class LinkedList {
    var head: Node?
    var tail: Node?
}
    