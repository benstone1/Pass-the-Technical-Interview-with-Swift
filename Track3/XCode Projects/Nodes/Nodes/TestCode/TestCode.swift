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
      LessonStacksSwift(),
      /*ArticleSwappingElementsInALinkedList(),
      ArticleTwoPointerTechnique(),
      
      BasicStackTest(),
      BasicQueueTest(),
      BasicNodesTest(),
      GermanCarsTest(),*/
    ]
    
    runList.forEach { test in
      test.run()
    }
  }
}
