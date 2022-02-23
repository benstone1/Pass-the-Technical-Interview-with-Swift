class GraphNode {
    
  var data: String
  var neighboringNodes: [GraphNode]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode: Equatable {
  static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge {
  let nodeOne: GraphNode
  let nodeTwo: GraphNode
  var weight: Int? = nil
  
  init(nodeOne: GraphNode, nodeTwo: GraphNode) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  convenience init(nodeOne: GraphNode, nodeTwo: GraphNode, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
    self.weight = weight
  }
}

class Graph {
  var nodes: [GraphNode]
  var edges: [GraphEdge]
    
  init(nodes: [GraphNode]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode, _ nodeTwo: GraphNode, _ bidirectional: Bool) {
    edges.append(GraphEdge(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode, _ neighboringNodes: [(GraphNode, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode) {
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

// 1: Introduction to Graphs
// 1.a
class GraphNode1a {
    
  var data: String
  var neighboringNodes: [GraphNode1a]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode1a) {
      neighboringNodes.append(newNeighbor)
  }
  
  /* Remove these Functions */
  func addNeighbor(newNeighborData: String) {
      neighboringNodes.append(GraphNode1a(data: newNeighborData))
  }
  func addNeighbor(_ newNeighbor: [GraphNode1a]) {
      neighboringNodes.append(contentsOf: newNeighbor)
  }
  /*                        */
  
  /* Modify This Function   */
  func removeNeighbor(_ nodeToRemove: GraphNode1a) {
    if neighboringNodes.isEmpty {
      return
    } else if neighboringNodes.contains(nodeToRemove) {
      neighboringNodes.removeAll(where: {$0 == nodeToRemove})
      return
    } else {
      for node in neighboringNodes {
        node.removeNeighbor(nodeToRemove)
      }
    }
  }
  /*                        */
}
extension GraphNode1a: Equatable {
  static func == (lhs: GraphNode1a, rhs: GraphNode1a) -> Bool {
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode1a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class Graph1a {
  var nodes: [GraphNode1a]
    
  init(nodes: [GraphNode1a]) {
    self.nodes = nodes
  }
  
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
      self.neighboringNodes = []
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
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode1b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge1b {
  let nodeOne: GraphNode1b
  let nodeTwo: GraphNode1b
  
  init(nodeOne: GraphNode1b, nodeTwo: GraphNode1b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph1b {
  var nodes: [GraphNode1b]
  var edges: [GraphEdge1b]
    
  init(nodes: [GraphNode1b]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode1b, _ nodeTwo: GraphNode1b) {
    edges.append(GraphEdge1b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
  }
  
  func addEdge(_ nodeOne: GraphNode1b, _ neighboringNodes: [GraphNode1b]) {
    for node in neighboringNodes {
      addEdge(nodeOne, node)
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
}

// 2: Types of Graphs
// No code - just show and discuss the different Graphs -> 1. Acyclic 2. Cyclic && a. Undirected b. Directed 2b. Weighted

// 3: Acyclic Graphs -- Add: 1. Default bidirectional (Identifying that even acyclic graphs are different than trees)
// 3.a
class GraphNode3a {
    
  var data: String
  var neighboringNodes: [GraphNode3a]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
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
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode3a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge3a {
  let nodeOne: GraphNode3a
  let nodeTwo: GraphNode3a
  
  init(nodeOne: GraphNode3a, nodeTwo: GraphNode3a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph3a {
  var nodes: [GraphNode3a]
  var edges: [GraphEdge3a]
    
  init(nodes: [GraphNode3a]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode3a, _ nodeTwo: GraphNode3a) {
    edges.append(GraphEdge3a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    // Add your codde here
  }
  
  func addEdge(_ nodeOne: GraphNode3a, _ neighboringNodes: [GraphNode3a]) {
    for node in neighboringNodes {
      addEdge(nodeOne, node)
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
}

// 3.b -- add bidirectional
class GraphNode3b {
    
  var data: String
  var neighboringNodes: [GraphNode3b]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
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
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode3b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge3b {
  let nodeOne: GraphNode3b
  let nodeTwo: GraphNode3b
  
  init(nodeOne: GraphNode3b, nodeTwo: GraphNode3b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph3b {
  var nodes: [GraphNode3b]
  var edges: [GraphEdge3b]
    
  init(nodes: [GraphNode3b]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode3b, _ nodeTwo: GraphNode3b) {
    edges.append(GraphEdge3b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    nodeTwo.addNeighbor(nodeOne)
  }
  
  func addEdge(_ nodeOne: GraphNode3b, _ neighboringNodes: [GraphNode3b]) {
    for node in neighboringNodes {
      addEdge(nodeOne, node)
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
}

let nodeS3b = GraphNode3b(data: "Seattle")
let nodeNY3b = GraphNode3b(data: "New York")
let nodeA3b = GraphNode3b(data: "Atlanta")
let nodeC3b = GraphNode3b(data: "Chicago")
let graph3b = Graph3b(nodes: [nodeS3b, nodeNY3b, nodeA3b, nodeC3b])
graph3b.addEdge(nodeS3b, [nodeC3b, nodeNY3b])
graph3b.addEdge(nodeNY3b, [nodeA3b])


// 4: Cyclic Graphs:
// No code -- just talk about how the properties don't change but will identify the uniqueness of cyclic graphs in traversal and searching
let nodeS4a = GraphNode3b(data: "Seattle")
let nodeNY4a = GraphNode3b(data: "New York")
let nodeA4a = GraphNode3b(data: "Atlanta")
let nodeC4a = GraphNode3b(data: "Chicago")
let graph4a = Graph3b(nodes: [nodeS4a, nodeNY4a, nodeA4a, nodeC4a])
graph4a.addEdge(nodeS4a, [nodeC4a, nodeNY4a, nodeA4a])
graph4a.addEdge(nodeNY4a, [nodeA4a])

// 5: Undirected Graphs
// No codechange from #3

// 6: Directed Graphs
// 6.a
class GraphNode6a {
    
  var data: String
  var neighboringNodes: [GraphNode6a]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode6a) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode6a) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode6a: Equatable {
  static func == (lhs: GraphNode6a, rhs: GraphNode6a) -> Bool {
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode6a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge6a {
  let nodeOne: GraphNode6a
  let nodeTwo: GraphNode6a
  
  init(nodeOne: GraphNode6a, nodeTwo: GraphNode6a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph6a {
  var nodes: [GraphNode6a]
  var edges: [GraphEdge6a]
    
  init(nodes: [GraphNode6a]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode6a, _ nodeTwo: GraphNode6a) {
    edges.append(GraphEdge6a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    nodeTwo.addNeighbor(nodeOne)
  }
  
  func addEdge(_ nodeOne: GraphNode6a, _ neighboringNodes: [GraphNode6a]) {
    for node in neighboringNodes {
      addEdge(nodeOne, node)
    }
  }
  
  func removeNode(_ node: GraphNode6a) {
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

// 6.b
class GraphNode6b {
    
  var data: String
  var neighboringNodes: [GraphNode6b]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode6b) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode6b) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode6b: Equatable {
  static func == (lhs: GraphNode6b, rhs: GraphNode6b) -> Bool {
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode6b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge6b {
  let nodeOne: GraphNode6b
  let nodeTwo: GraphNode6b
  
  init(nodeOne: GraphNode6b, nodeTwo: GraphNode6b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph6b {
  var nodes: [GraphNode6b]
  var edges: [GraphEdge6b]
    
  init(nodes: [GraphNode6b]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode6b, _ nodeTwo: GraphNode6b, _ bidirectional: Bool) {
    edges.append(GraphEdge6b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode6b, _ neighboringNodes: [(GraphNode6b, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode6b) {
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

// 7: Weighted Graphs
// 7.a
class GraphNode7a {
    
  var data: String
  var neighboringNodes: [GraphNode7a]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode7a) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode7a) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode7a: Equatable {
  static func == (lhs: GraphNode7a, rhs: GraphNode7a) -> Bool {
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode7a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge7a {
  let nodeOne: GraphNode7a
  let nodeTwo: GraphNode7a
  
  init(nodeOne: GraphNode7a, nodeTwo: GraphNode7a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph7a {
  var nodes: [GraphNode7a]
  var edges: [GraphEdge7a]
    
  init(nodes: [GraphNode7a]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode7a, _ nodeTwo: GraphNode7a, _ bidirectional: Bool) {
    edges.append(GraphEdge7a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode7a, _ neighboringNodes: [(GraphNode7a, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode7a) {
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

// 7.b
class GraphNode7b {
    
  var data: String
  var neighboringNodes: [GraphNode7b]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
  }
  
  func addNeighbor(_ newNeighbor: GraphNode7b) {
      neighboringNodes.append(newNeighbor)
  }
  
  func removeNeighbor(_ nodeToRemove: GraphNode7b) {
    if let index = neighboringNodes.firstIndex(where: { $0 == nodeToRemove }) {
      neighboringNodes.remove(at: index)
    }
  }
}
extension GraphNode7b: Equatable {
  static func == (lhs: GraphNode7b, rhs: GraphNode7b) -> Bool {
      lhs.data == rhs.data && lhs.neighboringNodes == rhs.neighboringNodes
  }
}
extension GraphNode7b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

class GraphEdge7b {
  let nodeOne: GraphNode7b
  let nodeTwo: GraphNode7b
  var weight: Int? = nil
  
  init(nodeOne: GraphNode7b, nodeTwo: GraphNode7b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
  
  convenience init(nodeOne: GraphNode7b, nodeTwo: GraphNode7b, weight: Int) {
    self.init(nodeOne: nodeOne, nodeTwo: nodeTwo)
    self.weight = weight
  }
}

class Graph7b {
  var nodes: [GraphNode7b]
  var edges: [GraphEdge7b]
    
  init(nodes: [GraphNode7b]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(_ nodeOne: GraphNode7b, _ nodeTwo: GraphNode7b, _ bidirectional: Bool) {
    edges.append(GraphEdge7b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if bidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdge(_ nodeOne: GraphNode7b, _ neighboringNodes: [(GraphNode7b, Bool)]) {
    for (node, bidirectional) in neighboringNodes {
      addEdge(nodeOne, node, bidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode7b) {
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

// 8: Review
// 8.a

// 8.b
// We didn't discuss it, but consider a disconnected graph
