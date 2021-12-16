public class Node {
  public var data: String
  public var next: Node?
  
  public init(data: String) {
    self.data = data
  }
  
  public func printAllNodesRecursively(startingAt node: Node?) {
    guard let node = node else {return}
    print(node.data)
    printAllNodesRecursively(startingAt: node.next)
  }
  
  public func printAllNodes(startingAt node: Node) {
    var currentNode: Node? = node
    while let unwrappedNode = currentNode {
      print(unwrappedNode.data)
      currentNode = unwrappedNode.next
    }
  }
}
