//
//  TestCode.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/2/21.
//

import Foundation

class TestCode {
  
  func run() {
    
    let runList = [
      GermanCarsTest(),
      SwapNodesTest(),
      TwoPointerLinkedList()
    ]
    
    runList.forEach { test in
      test.run()
    }
  }
}