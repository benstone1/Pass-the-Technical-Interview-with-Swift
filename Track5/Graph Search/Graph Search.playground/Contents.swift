/*
 Cover the cases of:
 1. DFS
 2. BFS
 */


// 1: Depth-First Traversal (One Path) Acyclic Graphs (From 1 node to 1 node) -- All nodes Explored
// 1.a
class GraphNode1a {
    
  var data: String
  var neighboringNodes: [GraphNode1a]
  
  init(data: String) {
      self.data = data
      neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode1a) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode1a) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode1a: Equatable {
  static func == (lhs: GraphNode1a, rhs: GraphNode1a) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode1a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge1a {
  let nodeOne: GraphNode1a
  let nodeTwo: GraphNode1a
  var weight: Int? = nil
  
  init(nodeOne: GraphNode1a, nodeTwo: GraphNode1a, weight: Int?) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
    self.weight = weight
  }
}

class Graph1a {
  var nodes: [GraphNode1a]
  var edges: [GraphEdge1a]
    
  init(nodes: [GraphNode1a]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(from nodeOne: GraphNode1a, to nodeTwo: GraphNode1a, isBidirectional: Bool, weight: Int? = nil) {
    edges.append(GraphEdge1a(nodeOne: nodeOne, nodeTwo: nodeTwo, weight: weight))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(from nodeOne: GraphNode1a, to neighboringNodes: [(node: GraphNode1a, isBidirection: Bool, weight: Int?)]) {
    for (node, isBidirectional, weight) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
    }
  }
  
  func removeNode(_ node: GraphNode1a) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    node.neighboringNodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
}

// 1.b
class GraphNode1b {
    
  var data: String
  var neighboringNodes: [GraphNode1b]
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode1b) {
    neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode1b) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode1b: Equatable {
  static func == (lhs: GraphNode1b, rhs: GraphNode1b) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode1b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge1b {
  let nodeOne: GraphNode1b
  let nodeTwo: GraphNode1b
  var weight: Int? = nil
  
  init(nodeOne: GraphNode1b, nodeTwo: GraphNode1b, weight: Int?) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
    self.weight = weight
  }
}

class Graph1b {
  var nodes: [GraphNode1b]
  var edges: [GraphEdge1b]
    
  init(nodes: [GraphNode1b]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(from nodeOne: GraphNode1b, to nodeTwo: GraphNode1b, isBidirectional: Bool, weight: Int? = nil) {
    edges.append(GraphEdge1b(nodeOne: nodeOne, nodeTwo: nodeTwo, weight: weight))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(from nodeOne: GraphNode1b, to neighboringNodes: [(node: GraphNode1b, isBidirectional: Bool, weight: Int?)]) {
    for (node, isBidirectional, weight) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
    }
  }
  
  func removeNode(_ node: GraphNode1b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    node.neighboringNodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
  
  // Identifies all nodes explored from start to end, in order of DFS
  func dfs(startingAt startNode: GraphNode1b) -> [GraphNode1b] {
    var stack = [startNode]
    var visitedNodes = [GraphNode1b]()
    
    while let currentNode = stack.popLast() {
      if !visitedNodes.contains(currentNode) {
        visitedNodes.append(currentNode)
      }
      for neighbor in currentNode.neighboringNodes {
        stack.append(neighbor)
      }
    }

    return visitedNodes
  }
}

let node1 = GraphNode1b(data: "1")

let node11 = GraphNode1b(data: "11")
let node12 = GraphNode1b(data: "12")

let node111 = GraphNode1b(data: "111")
let node112 = GraphNode1b(data: "112")

let graph = Graph1b(nodes: [node1, node11, node12])
graph.addEdge(from: node1, to: node11, isBidirectional: false)
graph.addEdge(from: node1, to: node12, isBidirectional: false)
graph.addEdge(from: node11, to: node111, isBidirectional: false)
graph.addEdge(from: node11, to: node112, isBidirectional: false)

print(graph)
let stack = graph.dfs(startingAt: node1)
print(stack)


// 2: Depth-First Traversal (Same as #1 but allows for cyclic graphs)
// 2.a
class GraphNode2a {
    
  var data: String
  var neighboringNodes: [GraphNode2a]
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode2a) {
    neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode2a) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode2a: Equatable {
  static func == (lhs: GraphNode2a, rhs: GraphNode2a) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode2a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge2a {
  let nodeOne: GraphNode2a
  let nodeTwo: GraphNode2a
  var weight: Int? = nil
  
  init(nodeOne: GraphNode2a, nodeTwo: GraphNode2a, weight: Int?) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
    self.weight = weight
  }
}

class Graph2a {
  var nodes: [GraphNode2a]
  var edges: [GraphEdge2a]
    
  init(nodes: [GraphNode2a]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(from nodeOne: GraphNode2a, to nodeTwo: GraphNode2a, isBidirectional: Bool, weight: Int? = nil) {
    edges.append(GraphEdge2a(nodeOne: nodeOne, nodeTwo: nodeTwo, weight: weight))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(from nodeOne: GraphNode2a, to neighboringNodes: [(node: GraphNode2a, isBidirectiona: Bool, weight: Int?)]) {
    for (node, isBidirectional, weight) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
    }
  }
  
  func removeNode(_ node: GraphNode2a) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    node.neighboringNodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
  
  // Identifies all nodes explored from start to end, in order of DFS
  func dfs(startingAt startNode: GraphNode1b) -> [GraphNode1b] {
    var stack = [startNode]
    var visitedNodes = [GraphNode1b]()
    
    while let currentNode = stack.popLast() {
      if !visitedNodes.contains(currentNode) {
        visitedNodes.append(currentNode)
      }
      for neighbor in currentNode.neighboringNodes {
        stack.append(neighbor)
      }
    }

    return visitedNodes
  }
}

// 2.b
class GraphNode2b {
    
  var data: String
  var neighboringNodes: [GraphNode2b]
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode2b) {
    neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode2b) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode2b: Equatable {
  static func == (lhs: GraphNode2b, rhs: GraphNode2b) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode2b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge2b {
  let nodeOne: GraphNode2b
  let nodeTwo: GraphNode2b
  var weight: Int? = nil
  
  init(nodeOne: GraphNode2b, nodeTwo: GraphNode2b, weight: Int?) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
    self.weight = weight
  }
}

class Graph2b {
  var nodes: [GraphNode2b]
  var edges: [GraphEdge2b]
  
  init(nodes: [GraphNode2b]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(from nodeOne: GraphNode2b, to nodeTwo: GraphNode2b, isBidirectional: Bool, weight: Int? = nil) {
    edges.append(GraphEdge2b(nodeOne: nodeOne, nodeTwo: nodeTwo, weight: weight))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(from nodeOne: GraphNode2b, to neighboringNodes: [(node: GraphNode2b, isBidirectional: Bool, weight: Int?)]) {
    for (node, isBidirectional, weight) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
    }
  }
  
  func removeNode(_ node: GraphNode2b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    node.neighboringNodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
  
  // Identifies all nodes explored from start to end, in order of DFS (allows for cyclic graphs)
  func dfs(startingAt startNode: GraphNode2b) -> [GraphNode2b] {
    var stack = [startNode]
    var visitedNodes = [GraphNode2b]()
    
    while let currentNode = stack.popLast() {
      if !visitedNodes.contains(currentNode) {
        visitedNodes.append(currentNode)
      }
      for neighbor in currentNode.neighboringNodes where !visitedNodes.contains(neighbor) {
        stack.append(neighbor)
      }
    }

    return visitedNodes
  }
}

let node2 = GraphNode2b(data: "1")

let node21 = GraphNode2b(data: "11")
let node22 = GraphNode2b(data: "12")

let node211 = GraphNode2b(data: "111")
let node212 = GraphNode2b(data: "112")

let graph2 = Graph2b(nodes: [node2, node21, node22, node212, node211])
graph2.addEdge(from: node2, to: node21, isBidirectional: true)
graph2.addEdge(from: node2, to: node22, isBidirectional: true)
graph2.addEdge(from: node21, to: node211, isBidirectional: true)
graph2.addEdge(from: node21, to: node212, isBidirectional: true)
graph2.addEdge(from: node2, to: node212, isBidirectional: true)

print(graph2)
let stack2 = graph2.dfs(startingAt: node2)
print(stack2)


// 3: Breadth-First Travesal (First Layer) This is the beginning of the algorithm
// 3.a
class GraphNode3a {

  var data: String
  var neighboringNodes: [GraphNode3a]
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode3a) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode3a) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode3a: Equatable {
  static func == (lhs: GraphNode3a, rhs: GraphNode3a) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode3a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge3a {
  let nodeOne: GraphNode3a
  let nodeTwo: GraphNode3a
  var weight: Int? = nil
  
  init(nodeOne: GraphNode3a, nodeTwo: GraphNode3a, weight: Int?) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
    self.weight = weight
  }
}

class Graph3a {
  var nodes: [GraphNode3a]
  var edges: [GraphEdge3a]
    
  init(nodes: [GraphNode3a]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(from nodeOne: GraphNode3a, to nodeTwo: GraphNode3a, isBidirectional: Bool, weight: Int? = nil) {
    edges.append(GraphEdge3a(nodeOne: nodeOne, nodeTwo: nodeTwo, weight: weight))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(from nodeOne: GraphNode3a, to neighboringNodes: [(node: GraphNode3a, isBidirectiona: Bool, weight: Int?)]) {
    for (node, isBidirectional, weight) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
    }
  }
  
  func removeNode(_ node: GraphNode3a) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    node.neighboringNodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
}

class QueueNode<Element: Equatable> {
  var data: Element
  var next: QueueNode<Element>?
  
  init(data: Element) {
    self.data = data
  }
}

struct Queue<Element: Equatable> {
  var head: QueueNode<Element>?
  var tail: QueueNode<Element>?
  
  func peek() -> Element? {
    return head?.data
  }
  
  mutating func enqueue(_ data: Element) {
    let newNode = QueueNode(data: data)
    
    guard let lastNode = tail else {
      head = newNode
      tail = newNode
      return
    }
    
    lastNode.next = newNode
    tail = newNode
  }
  
  mutating func dequeue() -> Element? {
    var removedNode: Element?
    
    if let firstNode = head {
      removedNode = firstNode.data
    }
    if head === tail {
      tail = nil
    }
    head = head?.next
    return removedNode
  }
}


// 3.b
class GraphNode3b {
    
  var data: String
  var neighboringNodes: [GraphNode3b]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
  }
  
  func addNeighbor(_ newNeighbor: GraphNode3b) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode3b) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode3b: Equatable {
  static func == (lhs: GraphNode3b, rhs: GraphNode3b) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode3b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge3b {
  let nodeOne: GraphNode3b
  let nodeTwo: GraphNode3b
  var weight: Int? = nil
  
  init(nodeOne: GraphNode3b, nodeTwo: GraphNode3b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode3b, nodeTwo: GraphNode3b, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
    self.weight = weight
  }
}

class Graph3b {
  var nodes: [GraphNode3b]
  var edges: [GraphEdge3b]
    
  init(nodes: [GraphNode3b]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode3b, _ nodeTwo: GraphNode3b, _ bidirectional: Bool) {
    edges.append(GraphEdge3b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode3b, _ neighboringNodes: [(GraphNode3b, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode3b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    
    for neighbor in node.neighboringNodes {
      neighbor.removeNeighbor(node)
    }
  }
  
  // print Method
  func print() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
  
  func bfs(startingAt startNode: GraphNode3b) -> [GraphNode3b] {
    var queue = Queue<GraphNode3b>()
    queue.enqueue(startNode)
    var visitedNodes = [GraphNode3b]()
    while let currentNode = queue.dequeue() {
      if !visitedNodes.contains(currentNode) {
        visitedNodes.append(currentNode)
      }
      for neighbor in currentNode.neighboringNodes {
        queue.enqueue(neighbor)
      }
    }
    return visitedNodes
  }
}

let node3 = GraphNode3b(data: "1")

let node31 = GraphNode3b(data: "11")
let node32 = GraphNode3b(data: "12")

let node311 = GraphNode3b(data: "111")
let node312 = GraphNode3b(data: "112")

let graph3 = Graph3b(nodes: [node3, node31, node32, node311, node312])
graph3.addEdge(node3, node31, false)
graph3.addEdge(node3, node32, false)
graph3.addEdge(node31, node311, false)
graph3.addEdge(node31, node312, false)

print(graph3)
let stack3 = graph3.bfs(startingAt: node3)
Swift.print(stack3)

// 4: Breadth-First Traversal (All Layers) -- Traverse all nodes BFS Style
// 4.a
class GraphNode4a {
    
  var data: String
  var neighboringNodes: [GraphNode4a]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
  }
  
  func addNeighbor(_ newNeighbor: GraphNode4a) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode4a) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode4a: Equatable {
  static func == (lhs: GraphNode4a, rhs: GraphNode4a) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode4a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge4a {
  let nodeOne: GraphNode4a
  let nodeTwo: GraphNode4a
  var weight: Int? = nil
  
  init(nodeOne: GraphNode4a, nodeTwo: GraphNode4a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode4a, nodeTwo: GraphNode4a, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
    self.weight = weight
  }
}

class Graph4a {
  var nodes: [GraphNode4a]
  var edges: [GraphEdge4a]
    
  init(nodes: [GraphNode4a]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode4a, _ nodeTwo: GraphNode4a, _ bidirectional: Bool) {
    edges.append(GraphEdge4a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode4a, _ neighboringNodes: [(GraphNode4a, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode4a) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    
    for neighbor in node.neighboringNodes {
      neighbor.removeNeighbor(node)
    }
  }
  
  // print Method
  func print() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
  
  func bfs(startingAt startNode: GraphNode3b) -> [GraphNode3b] {
    var queue = Queue<GraphNode3b>()
    queue.enqueue(startNode)
    var visitedNodes = [GraphNode3b]()
    while let currentNode = queue.dequeue() {
      if !visitedNodes.contains(currentNode) {
        visitedNodes.append(currentNode)
      }
      for neighbor in currentNode.neighboringNodes {
        queue.enqueue(neighbor)
      }
    }
    return visitedNodes
  }
}

// 4.b
class GraphNode4b {
    
  var data: String
  var neighboringNodes: [GraphNode4b]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
  }
  
  func addNeighbor(_ newNeighbor: GraphNode4b) {
    neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode4b) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode4b: Equatable {
  static func == (lhs: GraphNode4b, rhs: GraphNode4b) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode4b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge4b {
  let nodeOne: GraphNode4b
  let nodeTwo: GraphNode4b
  var weight: Int? = nil
  
  init(nodeOne: GraphNode4b, nodeTwo: GraphNode4b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode4b, nodeTwo: GraphNode4b, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
    self.weight = weight
  }
}

class Graph4b {
  var nodes: [GraphNode4b]
  var edges: [GraphEdge4b]
    
  init(nodes: [GraphNode4b]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode4b, _ nodeTwo: GraphNode4b, _ bidirectional: Bool) {
    edges.append(GraphEdge4b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode4b, _ neighboringNodes: [(GraphNode4b, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode4b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    
    for neighbor in node.neighboringNodes {
      neighbor.removeNeighbor(node)
    }
  }
  
  // print Method
  func print() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
  
  func bfs(startingAt startNode: GraphNode4b) -> [GraphNode4b] {
    var queue = Queue<GraphNode4b>()
    queue.enqueue(startNode)
    var visitedNodes = [GraphNode4b]()
    while let currentNode = queue.dequeue() {
      if !visitedNodes.contains(currentNode) {
        visitedNodes.append(currentNode)
      }
      for neighbor in currentNode.neighboringNodes where !visitedNodes.contains(neighbor) {
        queue.enqueue(neighbor)
      }
    }
    return visitedNodes
  }
}

let node4 = GraphNode4b(data: "1")

let node41 = GraphNode4b(data: "11")
let node42 = GraphNode4b(data: "12")
let node43 = GraphNode4b(data: "13")

let node411 = GraphNode4b(data: "111")
let node412 = GraphNode4b(data: "112")
let node421 = GraphNode4b(data: "211")
let node431 = GraphNode4b(data: "311")

let graph4 = Graph4b(nodes: [node4, node41, node42, node411, node412, node43, node421, node431])
graph4.addEdge(node4, node41, true)
graph4.addEdge(node4, node42, true)
graph4.addEdge(node4, node43, true)
graph4.addEdge(node41, node411, true)
graph4.addEdge(node41, node412, true)
graph4.addEdge(node42, node421, true)
graph4.addEdge(node43, node431, true)
graph4.addEdge(node4, node431, true)

Swift.print(graph4)
let stack4 = graph4.bfs(startingAt: node4)
Swift.print(stack4)
