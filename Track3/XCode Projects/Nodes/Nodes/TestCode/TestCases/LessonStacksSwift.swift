//
//  LessonStacksSwift.swift
//  Nodes
//
//  Created by Robert Pascazio on 12/21/21.
//

import Foundation

class LessonStacksSwift : Testable {
  
  func exercise1() {
  
    class Stack {
      var list: LinkedList?
      var size:Int

      init() {
        //
        list = LinkedList()
        size = 0
        //
      }
    }

    let list = Stack()
    print("This stack has \(list.size) nodes.")
  }

  func exercise2() {
    
    class Stack {

      var list: LinkedList?
      var size:Int
      var maximumSize:Int
    
      init(maximumSize:Int = Int.max) {
        //
        list = LinkedList()
        size = 0
        self.maximumSize = maximumSize
        //
      }
    }
    
    let stack1 = Stack(maximumSize: 6)
    let stack2 = Stack()
    print("stack1 can have \(stack1.maximumSize) nodes!")
    print("stack2 can have \(stack2.maximumSize) nodes!")
  }

  func exercise3() {
    
    class Stack {

      var list: LinkedList?
      var size:Int
      var maximumSize:Int
    
      init(maximumSize:Int = Int.max) {
        list = LinkedList()
        size = 0
        self.maximumSize = maximumSize
      }
      
      func push(_ data:String) {
        //
        list?.add(data)
        size += 1
        print("Added \(data)! Stack size is now \(size)")
        //
      }
    }
    
    let dishes = Stack()
    dishes.push("blue plate");
    dishes.push("white plate");
    dishes.push("yellow plate");
    print("The \(dishes.list?.head?.data ?? "unknown value") is at the top of the stack.");
  }
  
  func exercise4() {
    
    class Stack {

      var list: LinkedList?
      var size:Int
      var maximumSize:Int
    
      init(maximumSize:Int = Int.max) {
        list = LinkedList()
        size = 0
        self.maximumSize = maximumSize
      }
      
      func push(_ data:String) {
        list?.add(data)
        size += 1
        print("Added \(data)! Stack size is now \(size)")
      }
      
      func pop() -> String? {
        let node = list?.remove()
        if node != nil {
          size -= 1
        }
        print("Removed \(node?.data ?? "unknown value")! Stack size is now \(size)")
        return node?.data
      }
      
      func peek() -> String? {
        var data:String? = nil
        let node = list?.head
        if node != nil {
          data = node?.data
        }
        return data
      }

    }
    let bracelets = Stack()
    bracelets.push("silver")
    bracelets.push("gold")
    bracelets.push("bronze")
    bracelets.pop()
    bracelets.pop()
    print("I decided I only want to wear the \(bracelets.peek()!) bracelet!")
  }
  
  func exercise5() {
    
    class Stack {

      var list: LinkedList?
      var size:Int
      var maximumSize:Int
    
      init(maximumSize:Int = Int.max) {
        list = LinkedList()
        size = 0
        self.maximumSize = maximumSize
      }
      
      func push(_ data:String) {
        if hasSpace() {
          list?.add(data)
          size += 1
          print("Added \(data)! Stack size is now \(size)")
        } else {
          print("No more space on the stack.")
        }
      }
      
      func pop() -> String? {
        if !isEmpty() {
          let node = list?.remove()
          if node != nil {
            size -= 1
          }
          print("Removed \(node?.data ?? "unknown value")! Stack size is now \(size)")
          return node?.data
        }
        return ""
      }
      
      func peek() -> String? {
        var data:String? = nil
        if !isEmpty() {
          let node = list?.head
          if node != nil {
            data = node?.data
          }
        }
        return data
      }

      //
      func hasSpace() -> Bool {
        if size < maximumSize {
          return true
        }
        return false
      }

      func isEmpty() -> Bool {
        if size == 0 {
          return true
        }
        return false
      }
      //
    }
    let bracelets = Stack(maximumSize: 2)
    bracelets.push("silver")
    bracelets.push("gold")
    bracelets.push("bronze")
    bracelets.pop()
    print("The last added is the \(bracelets.peek() ?? "empty value") bracelet!")
    bracelets.pop()
    print("The last added is the \(bracelets.peek() ?? "empty value") bracelet!")
  }
  override func run() {
    
    exercise1()
    exercise2()
    exercise3()
    exercise4()
    exercise5()
  }
}
