//
//  GermanCarsTest.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class GermanCarsTest : Testable {
  
  override func run() {
    let germanCars = LinkedList()
    germanCars.append("Volkswagen")
    germanCars.append("Porsche")
    germanCars.append("Audi")
    print(germanCars)
    print(germanCars.getNode(at: 1)!)  // Prints: Porsche -> Audi -> nil
    print(germanCars.getNode(at: 2)!)  // Prints: Audi -> nil
    _ = germanCars.removeNode(from: 1)!
    print(germanCars) // Prints: Porsche -> Audi -> nil
  }
}
