func bubbleSort(inputArray: inout [Int]) {
  for i in 0..<inputArray.count {
    for j in 1..<inputArray.count - i {
      if inputArray[j] < inputArray[j - 1] {
        print("Swapping values: \(inputArray[j]) and \(inputArray[j - 1])")
        inputArray.swapAt(j, j - 1)
      }
    }
  }
  print("Sorted array: \(inputArray)")
}

var countBackwards = [10, 8, 3, 1, -5]
print("Array 1 to sort: \(countBackwards)")
// Call bubble sort on reverse sorted
bubbleSort(inputArray: &countBackwards)
print("Sorted array 1: \(countBackwards)")

var countForwards = [5, 1, 3, 8, 10]
print("Array 2 to sort: \(countForwards)")
// Call bubble sort on sorted
bubbleSort(inputArray: &countForwards)
print("Sorted array 2: \(countForwards)")
