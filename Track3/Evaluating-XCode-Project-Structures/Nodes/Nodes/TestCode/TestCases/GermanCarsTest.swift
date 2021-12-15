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
    germanCars.appendNode("Volkswagen")
    germanCars.appendNode("Porsche")
    germanCars.appendNode("Audi")
    print(germanCars)
  }
}
