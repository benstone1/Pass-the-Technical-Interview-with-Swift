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
}


