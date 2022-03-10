/*
 Although this functions the pivot correctly, it doens't technically apply the "Space Complexity" that QuickSort is known for (in-place sorting vs mergesort's out-of-place sorting)
 Also,looking at the run time, this may run in O(n log n) but the actual execution is less efficient than #2. Just some considerations.
 */
// 1.

func quicksort1(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }

  let pivot = array[array.count / 2]
  let smallerElements = array.filter { $0 < pivot }
  let equalElements = array.filter { $0 == pivot }
  let greaterElements = array.filter { $0 > pivot }

  return quicksort1(smallerElements) + equalElements + quicksort1(greaterElements)
}

var array1 = [1, 9, 2, 8, 3, 7, 4, 6, 5]
let sorted1 = quicksort1(array1)
print(array1)
print(sorted1)


// 2.
func quicksort2(_ array: inout [Int], from start: Int, to end: Int) {
  if start < end {
    let partititonIndex = partition(&array, from: start, to: end)
    quicksort2(&array, from: start, to: partititonIndex-1)
    quicksort2(&array, from: partititonIndex+1, to: end)
  }
}

func partition(_ array: inout [Int], from start: Int, to end: Int) -> Int {
  let pivot = array[end]
  
  var currentIndex = start
  for index in currentIndex..<end {
    if array[index] <= pivot {
      array.swapAt(currentIndex, index)
      currentIndex += 1
    }
  }
  
  array.swapAt(currentIndex, end)
  return currentIndex
}

var array2 = [1, 9, 2, 8, 3, 7, 4, 6, 5]
print(array2)
quicksort2(&array2, from: 0, to: array2.count-1)
print(array2)
