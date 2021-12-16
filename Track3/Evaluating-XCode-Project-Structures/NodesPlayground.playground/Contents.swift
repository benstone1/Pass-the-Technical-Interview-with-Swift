import UIKit

var greeting = "Hello, playground"

let nodeApple = Node(data: "apple")
let nodeOrange = Node(data: "orange")
let nodeBannana = Node(data: "bannana")

nodeApple.next = nodeOrange
nodeOrange.next = nodeBannana

nodeApple.printAllNodes(startingAt: nodeApple)
nodeApple.printAllNodesRecursively(startingAt: nodeApple)

