

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
      return lhs === rhs
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
  
  func addEdge(from nodeOne: GraphNode1b, to nodeTwo: GraphNode1b) {
    edges.append(GraphEdge1b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
  }
  
  func addEdges(from nodeOne: GraphNode1b, to neighboringNodes: [GraphNode1b]) {
    for node in neighboringNodes {
      addEdge(from: nodeOne, to: node)
    }
  }
  
  func removeNode(_ node: GraphNode1b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    nodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
}

// 2: Types of Graphs
// No code - just show and discuss the different Graphs -> 1. Acyclic 2. Cyclic && a. Undirected b. Directed 2b. Weighted

// 3: Acyclic Graphs -- Add: 1. Default bidirectional (Identifying that even acyclic graphs are different than trees)
let nodeCar3a = GraphNode1b(data: "Car")
let nodeBus3a = GraphNode1b(data: "Bus")
let nodeBike3a = GraphNode1b(data: "Bike")
let nodeHelicopter3a = GraphNode1b(data: "Helicopter")
let nodeGas3a = GraphNode1b(data: "Gas")
let nodeRun3a = GraphNode1b(data: "Run")
let nodeChange3a = GraphNode1b(data: "Change")
let nodeSpa3a = GraphNode1b(data: "Spa")
let nodeHome3a = GraphNode1b(data: "Home")
let graph3a = Graph1b(nodes: [nodeCar3a, nodeBus3a, nodeBike3a, nodeHelicopter3a, nodeGas3a, nodeRun3a, nodeChange3a, nodeSpa3a, nodeHome3a])
graph3a.addEdge(from: nodeCar3a, to: nodeGas3a)
graph3a.addEdge(from: nodeBus3a, to: nodeRun3a)
graph3a.addEdge(from: nodeBike3a, to: nodeChange3a)
graph3a.addEdge(from: nodeHelicopter3a, to: nodeHome3a)
graph3a.addEdge(from: nodeGas3a, to: nodeHome3a)
graph3a.addEdge(from: nodeRun3a, to: nodeHome3a)
graph3a.addEdge(from: nodeChange3a, to: nodeHome3a)
graph3a.addEdge(from: nodeSpa3a, to: nodeHome3a)


// 4: Cyclic Graphs:
// No code -- just talk about how the properties don't change but will identify the uniqueness of cyclic graphs in traversal and searching
let nodeGarage4a = GraphNode1b(data: "Bike out of Garage")
let nodeGetOn4a = GraphNode1b(data: "Get on Bike")
let nodePedal4a = GraphNode1b(data: "Pedal Bike")
let nodeFall4a = GraphNode1b(data: "Fall off Bike")
let nodeGetOff4a = GraphNode1b(data: "Get off Bike")
let graph4a = Graph1b(nodes: [nodeGarage4a, nodeGetOn4a, nodePedal4a, nodeFall4a, nodeGetOff4a])
graph4a.addEdge(from: nodeGarage4a, to: nodeGetOn4a)
graph4a.addEdge(from: nodeGetOn4a, to: nodePedal4a)
graph4a.addEdge(from: nodePedal4a, to: nodeFall4a)
graph4a.addEdge(from: nodePedal4a, to: nodeGetOff4a)
graph4a.addEdge(from: nodeFall4a, to: nodeGetOn4a)

// 5: Undirected Graphs
class GraphNode5a {
    
  var data: String
  var neighboringNodes: [GraphNode5a]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
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
  
  init(nodeOne: GraphNode5a, nodeTwo: GraphNode5a) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph5a {
  var nodes: [GraphNode5a]
  var edges: [GraphEdge5a]
    
  init(nodes: [GraphNode5a]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(from nodeOne: GraphNode5a, to nodeTwo: GraphNode5a) {
    edges.append(GraphEdge5a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    // Add your codde here
  }
  
  func addEdges(from nodeOne: GraphNode5a, to neighboringNodes: [GraphNode5a]) {
    for node in neighboringNodes {
      addEdge(from: nodeOne, to: node)
    }
  }
  
  func removeNode(_ node: GraphNode5a) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    nodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
}

// 5.b -- add bidirectional
class GraphNode5b {
    
  var data: String
  var neighboringNodes: [GraphNode5b]
  
  init(data: String) {
      self.data = data
      self.neighboringNodes = []
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
  
  init(nodeOne: GraphNode5b, nodeTwo: GraphNode5b) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
  }
}

class Graph5b {
  var nodes: [GraphNode5b]
  var edges: [GraphEdge5b]
    
  init(nodes: [GraphNode5b]) {
    self.nodes = nodes
    self.edges = []
  }
  
  func addEdge(from nodeOne: GraphNode5b, to nodeTwo: GraphNode5b) {
    edges.append(GraphEdge5b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    edges.append(GraphEdge7b(nodeOne: nodeTwo, nodeTwo: nodeOne))
    nodeTwo.addNeighbor(nodeOne)
  }
  
  func addEdges(from nodeOne: GraphNode5b, to neighboringNodes: [GraphNode5b]) {
    for node in neighboringNodes {
      addEdge(from: nodeOne, to: node)
    }
  }
  
  func removeNode(_ node: GraphNode5b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    nodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
}

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
      return lhs === rhs
  }
}
extension GraphNode6a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge6a {
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
    edges.append(GraphEdge7b(nodeOne: nodeTwo, nodeTwo: nodeOne))
    nodeTwo.addNeighbor(nodeOne)
  }
  
  func addEdges(_ nodeOne: GraphNode6a, _ neighboringNodes: [GraphNode6a]) {
    for node in neighboringNodes {
      addEdge(nodeOne, node)
    }
  }
  
  func removeNode(_ node: GraphNode6a) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    nodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
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
      return lhs === rhs
  }
}
extension GraphNode6b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge6b {
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
  
  func addEdge(from nodeOne: GraphNode6b, to nodeTwo: GraphNode6b, isBidirectional: Bool) {
    edges.append(GraphEdge6b(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      edges.append(GraphEdge7b(nodeOne: nodeTwo, nodeTwo: nodeOne))
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(from nodeOne: GraphNode6b, to neighboringNodes: [(node: GraphNode6b, isBidirectional: Bool)]) {
    for (node, isBidirectional) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode6b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    nodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
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
      return lhs === rhs
  }
}
extension GraphNode7a: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge7a {
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
  
  func addEdge(from nodeOne: GraphNode7a, to nodeTwo: GraphNode7a, isBidirectional: Bool) {
    edges.append(GraphEdge7a(nodeOne: nodeOne, nodeTwo: nodeTwo))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(_ nodeOne: GraphNode7a, _ neighboringNodes: [(GraphNode7a, Bool)]) {
    for (node, isBidirectional) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional)
    }
  }
  
  func removeNode(_ node: GraphNode7a) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    nodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
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
      return lhs === rhs
  }
}
extension GraphNode7b: CustomStringConvertible {
  var description: String {
      return "\(data)"
  }
}

struct GraphEdge7b {
  let nodeOne: GraphNode7b
  let nodeTwo: GraphNode7b
  var weight: Int? = nil
  
  init(nodeOne: GraphNode7b, nodeTwo: GraphNode7b, weight: Int?) {
    self.nodeOne = nodeOne
    self.nodeTwo = nodeTwo
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
  
  func addEdge(from nodeOne: GraphNode7b, to nodeTwo: GraphNode7b, isBidirectional: Bool, weight: Int? = nil) {
    edges.append(GraphEdge7b(nodeOne: nodeOne, nodeTwo: nodeTwo, weight: weight))
    nodeOne.addNeighbor(nodeTwo)
    if isBidirectional {
      edges.append(GraphEdge7b(nodeOne: nodeTwo, nodeTwo: nodeOne, weight: weight))
      nodeTwo.addNeighbor(nodeOne)
    }
  }
  
  func addEdges(from nodeOne: GraphNode7b, to neighboringNodes: [(node: GraphNode7b, isBidirectional: Bool, weight: Int?)]) {
    for (node, isBidirectional, weight) in neighboringNodes {
      addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
    }
  }
  
  func removeNode(_ node: GraphNode7b) {
    if let index = nodes.firstIndex(where: { $0 == node }) {
      nodes.remove(at: index)
    }
    
    edges = edges.filter({ $0.nodeOne != node || $0.nodeTwo != node })
    nodes.forEach { $0.removeNeighbor(node) }
  }
  
  // print Method
  func printGraph() {
    for node in nodes {
      Swift.print("\(node): \(node.neighboringNodes)")
    }
  }
}

// 8: Review
let nodeAtlanta = GraphNode7b(data: "Atlanta")
let nodeNewYork = GraphNode7b(data: "New York")
let nodeChicago = GraphNode7b(data: "Chicago")
let nodeOrlando = GraphNode7b(data: "Orlando")
let nodeLosAngeles = GraphNode7b(data: "Los Angeles")
let graph7b = Graph7b(nodes: [nodeAtlanta, nodeNewYork, nodeChicago, nodeOrlando, nodeLosAngeles])
graph7b.addEdges(from: nodeAtlanta, to: [(node: nodeNewYork, isBidirectional: false, weight: 250), (node: nodeOrlando, isBidirectional: false, weight: 80)])
graph7b.addEdges(from: nodeOrlando, to: [(node: nodeAtlanta, isBidirectional: false, weight: 100), (node: nodeNewYork, isBidirectional: false, weight: 400), (node: nodeChicago, isBidirectional: false, weight: 200)])
graph7b.addEdges(from: nodeLosAngeles, to: [(node: nodeChicago, isBidirectional: false, weight: 125), (node: nodeAtlanta, isBidirectional: false, weight:250)])
graph7b.addEdge(from: nodeChicago, to: nodeNewYork, isBidirectional: false, weight: 190)
graph7b.addEdges(from: nodeNewYork, to: [(node: nodeLosAngeles, isBidirectional: false, weight: 400), (node: nodeAtlanta, isBidirectional: false, weight: 200)])
