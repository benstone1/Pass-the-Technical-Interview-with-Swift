import Foundation

// Lesson 1 - build out linear search

func firstIndex<T: Equatable>(of target: T, in arr: [T]) -> Int? {
  for (index, value) in arr.enumerated() where value == target {
    return index
  }
  return nil
}

let values = [5, 2, 4, 7]
let targetValue = 2
if let index = firstIndex(of:targetValue, in:values) {
  print("Value found at index \(index)")
} else {
  print("Value not found")
}

// Lesson 2 - calling

func firstIndex2<T: Equatable>(of target: T, in arr: [T]) -> Int? {
  for (index, value) in arr.enumerated() where value == target {
    return index
  }
  return nil
}

// Call the function below
let values2 = [ 10, 14, 19, 26, 27, 31, 33, 35, 42, 44]
let targetValue2 = 33
if let index = firstIndex2(of:targetValue2, in:values2) {
  print("Value found at index \(index)")
} else {
  print("Value not found")
}

// Lesson 3 : Finding multiple occurances

func allIndices<T: Equatable>(matching target: T, in arr: [T]) -> [Int] {
  var matches = [Int]()
  for (index, value) in arr.enumerated() where value == target {
    matches.append(index)
  }
  return matches
}

let tourLocations = [ "New York City", "Los Angeles", "Bangkok", "Istanbul", "London", "New York City", "Toronto"]
let targetCity = "New York City"
let tourStops = allIndices(matching: targetCity, in: tourLocations)
if tourStops.count > 0 {
  print("There are \(tourStops.count) stops on the tour.")
} else {
  print("No tour stops found.")
}

// Lesson 4 : Maximum Value
func maximumValue<T: Comparable>(in arr: [T]) -> T? {
  guard !arr.isEmpty else {
    return nil
  }
  var max = arr[0]
  for value in arr where value > max {
    max = value
  }
  return max
}
let testScores = [88, 93, 75, 100, 380, 67, 71, 92, 90, 83]
if let topScore = maximumValue(in: testScores) {
  print("The top score is \(topScore).")
} else {
  print("No scores found.")
}
