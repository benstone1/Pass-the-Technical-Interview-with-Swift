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
  
  init(nodeOne: GraphNode1a, nodeTwo: GraphNode1a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode1a, nodeTwo: GraphNode1a, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
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
  
  func addEdge(_ nodeOne: GraphNode1a, _ nodeTwo: GraphNode1a, _ bidirectional: Bool) {
    edges.append(GraphEdge1a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode1a, _ neighboringNodes: [(GraphNode1a, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode1a) {
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
  
  init(nodeOne: GraphNode1b, nodeTwo: GraphNode1b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode1b, nodeTwo: GraphNode1b, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
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
  
  func addEdge(_ nodeOne: GraphNode1b, _ nodeTwo: GraphNode1b, _ bidirectional: Bool) {
    edges.append(GraphEdge1b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode1b, _ neighboringNodes: [(GraphNode1b, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode1b) {
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
  
  // Identifies all nodes explored from start to end, in order of DFS
  func DFS(from start: GraphNode1b, to end: GraphNode1b) -> [GraphNode1b] {
    var nodesExplored = [start]

    for neighbor in start.neighboringNodes {
      if !nodesExplored.contains(end) {
        nodesExplored += DFS(from: neighbor, to: end)
      }
    }

    return nodesExplored
  }
}

let node1 = GraphNode1b(data: "1")

let node11 = GraphNode1b(data: "11")
let node12 = GraphNode1b(data: "12")

let node111 = GraphNode1b(data: "111")
let node112 = GraphNode1b(data: "112")

let graph = Graph1b(nodes: [node1, node11, node12])
graph.addEdge(node1, node11, false)
graph.addEdge(node1, node12, false)
graph.addEdge(node11, node111, false)
graph.addEdge(node11, node112, false)

print(graph)
let stack = graph.DFS(from: node1, to: node112)
print(stack)


// 2: Depth-First Traversal (Same as #1 but allows for cyclic graphs)
// 2.a
class GraphNode2a {
    
  var data: String
  var neighboringNodes: [GraphNode2a]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
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
  
  init(nodeOne: GraphNode2a, nodeTwo: GraphNode2a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode2a, nodeTwo: GraphNode2a, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
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
  
  func addEdge(_ nodeOne: GraphNode2a, _ nodeTwo: GraphNode2a, _ bidirectional: Bool) {
    edges.append(GraphEdge2a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode2a, _ neighboringNodes: [(GraphNode2a, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode2a) {
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
  
  // Identifies all nodes explored from start to end, in order of DFS
  func DFS(from start: GraphNode2a, to end: GraphNode2a) -> [GraphNode2a] {
    var nodesExplored = [start]
    start.visited = true

    for neighbor in start.neighboringNodes {
      if !nodesExplored.contains(end) {
        nodesExplored += DFS(from: neighbor, to: end)
      }
    }

    return nodesExplored
  }
}

// 2.b
class GraphNode2b {
    
  var data: String
  var neighboringNodes: [GraphNode2b]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
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
  
  init(nodeOne: GraphNode2b, nodeTwo: GraphNode2b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode2b, nodeTwo: GraphNode2b, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
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
  
  func addEdge(_ nodeOne: GraphNode2b, _ nodeTwo: GraphNode2b, _ bidirectional: Bool) {
    edges.append(GraphEdge2b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode2b, _ neighboringNodes: [(GraphNode2b, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode2b) {
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
  
  // Identifies all nodes explored from start to end, in order of DFS (allows for cyclic graphs)
  func DFS(from start: GraphNode2b, to end: GraphNode2b) -> [GraphNode2b] {
    var nodesExplored = [start]
    start.visited = true
    
    for neighbor in start.neighboringNodes {
      if !neighbor.visited {
        if !nodesExplored.contains(end) {
          nodesExplored += DFS(from: neighbor, to: end)
        }
      }
    }

    return nodesExplored
  }
}

let node2 = GraphNode2b(data: "1")

let node21 = GraphNode2b(data: "11")
let node22 = GraphNode2b(data: "12")

let node211 = GraphNode2b(data: "111")
let node212 = GraphNode2b(data: "112")

let graph2 = Graph2b(nodes: [node2, node21, node22, node212, node211])
graph2.addEdge(node2, node21, true)
graph2.addEdge(node2, node22, true)
graph2.addEdge(node21, node211, true)
graph2.addEdge(node21, node212, true)
graph2.addEdge(node2, node212, true)

print(graph2)
let stack2 = graph2.DFS(from: node2, to: node212)
print(stack2)


// 3: Depth-First Traversal (All Paths) From beginning to end nodes, to include all nodes, as well as cyclic graphs
// 3.a
class GraphNode3a {
    
  var data: String
  var neighboringNodes: [GraphNode3a]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
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
  
  init(nodeOne: GraphNode3a, nodeTwo: GraphNode3a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode3a, nodeTwo: GraphNode3a, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
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
  
  func addEdge(_ nodeOne: GraphNode3a, _ nodeTwo: GraphNode3a, _ bidirectional: Bool) {
    edges.append(GraphEdge3a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode3a, _ neighboringNodes: [(GraphNode3a, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode3a) {
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
  
  // Identifies all nodes explored from start to end, in order of DFS (allows for cyclic graphs)
  func DFS(from start: GraphNode3a, to end: GraphNode3a) -> [GraphNode3a] {
    var nodesExplored = [start]
    start.visited = true
    
    for neighbor in start.neighboringNodes {
      if !neighbor.visited {
        if !nodesExplored.contains(end) {
          nodesExplored += DFS(from: neighbor, to: end)
        }
      }
    }

    return nodesExplored
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
  
  // Identifies all nodes/paths from beginning to end
  func DFS(from start: GraphNode3b, to end: GraphNode3b) -> [GraphNode3b] {
    var nodesExplored = [start]
    start.visited = true
    
    for neighbor in start.neighboringNodes {
      if !neighbor.visited {
        nodesExplored += DFS(from: neighbor, to: end)
      }
    }

    return nodesExplored
  }
}

// 4: Breadth-First Travesal (First Layer) This is the beginning of the algorithm
// 4.a
class GraphNode4a {

  var data: String
  var neighboringNodes: [GraphNode4a]
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
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
  
  func BFS(from start: GraphNode4b, to end: GraphNode4b) -> [GraphNode4b] {
    var nodesExplored:[GraphNode4b] = []
    var nodesQueue = [start]
    
    while !nodesQueue.isEmpty {
      let node = nodesQueue.remove(at: 0)
      if !nodesExplored.contains(end) {
        nodesExplored.append(node)
        nodesQueue.append(contentsOf: node.neighboringNodes.filter({ $0.visited == false && !nodesQueue.contains($0) }))
      }
    }
    
    return nodesExplored
  }
}

let node4 = GraphNode4b(data: "1")

let node41 = GraphNode4b(data: "11")
let node42 = GraphNode4b(data: "12")

let node411 = GraphNode4b(data: "111")
let node412 = GraphNode4b(data: "112")

let graph4 = Graph4b(nodes: [node4, node41, node42, node411, node412])
graph4.addEdge(node4, node41, false)
graph4.addEdge(node4, node42, false)
graph4.addEdge(node41, node411, true)
graph4.addEdge(node41, node412, true)

print(graph4)
let stack4 = graph4.BFS(from: node4, to: node42)
Swift.print(stack4)

// 5: Breadth-First Traversal (All Layers) -- Traverse all nodes BFS Style
// 5.a
class GraphNode5a {
    
  var data: String
  var neighboringNodes: [GraphNode5a]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
  }
  
  func addNeighbor(_ newNeighbor: GraphNode5a) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode5a) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode5a: Equatable {
  static func == (lhs: GraphNode5a, rhs: GraphNode5a) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode5a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge5a {
  let nodeOne: GraphNode5a
  let nodeTwo: GraphNode5a
  var weight: Int? = nil
  
  init(nodeOne: GraphNode5a, nodeTwo: GraphNode5a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode5a, nodeTwo: GraphNode5a, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
    self.weight = weight
  }
}

class Graph5a {
  var nodes: [GraphNode5a]
  var edges: [GraphEdge5a]
    
  init(nodes: [GraphNode5a]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode5a, _ nodeTwo: GraphNode5a, _ bidirectional: Bool) {
    edges.append(GraphEdge5a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode5a, _ neighboringNodes: [(GraphNode5a, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode5a) {
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
  
  func BFS(from start: GraphNode5a, to end: GraphNode5a) -> [GraphNode5a] {
    var nodesExplored:[GraphNode5a] = []
    var nodesQueue = [start]
    
    while !nodesQueue.isEmpty {
      let node = nodesQueue.remove(at: 0)
      node.visited = true
      if !nodesExplored.contains(end) {
        nodesExplored.append(node)
        nodesQueue.append(contentsOf: node.neighboringNodes.filter({ $0.visited == false }))
      }
    }
    
    return nodesExplored
  }
}

// 5.b
class GraphNode5b {
    
  var data: String
  var neighboringNodes: [GraphNode5b]
  var visited: Bool
  
  init(data: String) {
    self.data = data
    neighboringNodes = []
    visited = false
  }
  
  func addNeighbor(_ newNeighbor: GraphNode5b) {
    neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode5b) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode5b: Equatable {
  static func == (lhs: GraphNode5b, rhs: GraphNode5b) -> Bool {
      return lhs === rhs
  }
}
extension GraphNode5b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge5b {
  let nodeOne: GraphNode5b
  let nodeTwo: GraphNode5b
  var weight: Int? = nil
  
  init(nodeOne: GraphNode5b, nodeTwo: GraphNode5b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  init(nodeOne: GraphNode5b, nodeTwo: GraphNode5b, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
    self.weight = weight
  }
}

class Graph5b {
  var nodes: [GraphNode5b]
  var edges: [GraphEdge5b]
    
  init(nodes: [GraphNode5b]) {
    self.nodes = nodes
    edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode5b, _ nodeTwo: GraphNode5b, _ bidirectional: Bool) {
    edges.append(GraphEdge5b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode5b, _ neighboringNodes: [(GraphNode5b, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode5b) {
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
  
  func BFS(from start: GraphNode5b) -> [GraphNode5b] {
    var nodesExplored:[GraphNode5b] = []
    var nodesQueue = [start]
    
    while !nodesQueue.isEmpty {
      let node = nodesQueue.remove(at: 0)
      let unvisitedNeighbors = node.neighboringNodes.filter({ $0.visited == false && !nodesQueue.contains($0) })
      node.visited = true
      nodesExplored.append(node)
      nodesQueue.append(contentsOf: unvisitedNeighbors)
    }
    
    return nodesExplored
  }
}

let node5 = GraphNode5b(data: "1")

let node51 = GraphNode5b(data: "11")
let node52 = GraphNode5b(data: "12")
let node53 = GraphNode5b(data: "13")

let node511 = GraphNode5b(data: "111")
let node512 = GraphNode5b(data: "112")
let node521 = GraphNode5b(data: "211")
let node531 = GraphNode5b(data: "311")

let graph5 = Graph5b(nodes: [node5, node51, node52, node511, node512, node53, node521, node531])
graph5.addEdge(node5, node51, true)
graph5.addEdge(node5, node52, true)
graph5.addEdge(node5, node53, true)
graph5.addEdge(node51, node511, true)
graph5.addEdge(node51, node512, true)
graph5.addEdge(node52, node521, true)
graph5.addEdge(node53, node531, true)
graph5.addEdge(node5, node531, true)

Swift.print(graph5)
let stack5 = graph5.BFS(from: node5)
Swift.print(stack5)
