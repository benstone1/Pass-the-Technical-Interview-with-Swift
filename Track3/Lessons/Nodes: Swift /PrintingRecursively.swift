class Node {
    var data: String
    var next: Node? 

    init(data: String) {
        self.data = data
    }

    func printAllNodesRecursively(startingAt node: Node?) {
        guard let node = node else { return }
        print(node.data)
        printAllNodesRecursively(startingAt: node.next)
    }
}

