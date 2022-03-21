func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
  var leftIndex = 0
  var rightIndex = 0
  var orderedArray: [Int] = []
  
  while leftIndex < leftArray.count && rightIndex < rightArray.count {
    let leftElement = leftArray[leftIndex]
    let rightElement = rightArray[rightIndex]
    
    if leftElement < rightElement {
      orderedArray.append(leftElement)
      leftIndex += 1
    } else {
      orderedArray.append(rightElement)
      rightIndex += 1
    }
  }
  
  return orderedArray + Array(leftArray.dropFirst(leftIndex)) + Array(rightArray.dropFirst(rightIndex))
}

func mergeSort(_ inputArray: [Int]) -> [Int] {
  guard inputArray.count > 1 else {
      return inputArray
  }

  let midIndex = inputArray.count/2
  let leftArray = Array(inputArray[0..<midIndex])
  let rightArray = Array(inputArray[midIndex..<inputArray.count])
  print(leftArray, rightArray)

  let leftMerge = mergeSort(leftArray)
  let rightMerge = mergeSort(rightArray)

  return merge(leftArray: leftMerge, rightArray: rightMerge)
}

var countBackwards = [10, 8, 3, 1, -5]
print("Array 1 to sort: \(countBackwards)")
// Call Merge Sort on reverse sorted
var sortedArray1 = mergeSort(countBackwards)
print(sortedArray1)

var countForwards = [-5, 1, 3, 8, 10]
print("Array 2 to sort: \(countForwards)")
// Call Merge Sort on sorted
var sortedArray2 = mergeSort(countForwards)
print(sortedArray2)

