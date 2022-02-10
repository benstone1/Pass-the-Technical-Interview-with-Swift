import Foundation

// Lesson 1 - build out linear search

func linearSearch<T: Equatable>(allOf list: [T], forItem item: T) -> Int? {
  for (index, object) in list.enumerated() where object == item {
    return index
  }
  return nil
}

let values = [5, 2, 4, 7]
let item = 2
if let index = linearSearch(allOf:values, forItem:item) {
  print("Item found at index \(index)")
} else {
  print("No Item found")
}

// Lesson 2 - calling

let numberList = [ 10, 14, 19, 26, 27, 31, 33, 35, 42, 44]
let targetNumber = 33

func linearSearch2<T: Equatable>(allOf list: [T], forItem item: T) -> Int? {

  for (index, object) in list.enumerated() where object == item {
    return index
  }
  return nil
}

// Call the function below
if let index = linearSearch2(allOf:numberList, forItem:targetNumber) {
  print("Item found at index \(index)")
} else {
  print("No Item found")
}

// Lesson 3 : Finding multiple occurances

let tourLocations = [ "New York City", "Los Angeles", "Bangkok", "Istanbul", "London", "New York City", "Toronto"]
let targetCity = "New York City"

func searchOccurances<T: Equatable>(from list: [T], ofItem item: T) -> Int? {
  var matches = [Int]()
  list.enumerated().forEach { (index, element) in
    if element == item {
      matches.append(index)
    }
  }
  return matches.count > 0 ? matches.count : nil
}

if let tourStops = searchOccurances(from: tourLocations, ofItem: targetCity) {
  print("There are \(tourStops) stops on the tour.")
} else {
  print("No tour stops found.")
}

// Lesson 4 : Maximum Value
let testScores = [88, 93, 75, 100, 380, 67, 71, 92, 90, 83]

func searchMaximumValue<T: Comparable>(from list: [T]) -> Int? {
  guard list.count > 0 else {
    return nil
  }
  var maximumScoreIndex = 0
  list.enumerated().forEach { (index, element) in
    if element > list[maximumScoreIndex] {
      maximumScoreIndex = index
    }
  }
  return maximumScoreIndex
}
if let topScore = searchMaximumValue(from: testScores) {
  print("The top score was at index \(topScore).")
} else {
  print("No scores found.")
}
