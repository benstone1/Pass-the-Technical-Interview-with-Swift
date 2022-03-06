/*
 Although this functions the pivot correctly, it doens't technically apply the "Space Complexity" that QuickSort is known for (in-place sorting vs mergesort's out-of-place sorting)
 Also,looking at the run time, this may run in O(n log n) but the actual execution is less efficient than #2. Just some considerations.
 */
// 1.

func quicksort1(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }

  let pivot = array[array.count/2]
  let less = array.filter { $0 < pivot }
  let equal = array.filter { $0 == pivot }
  let greater = array.filter { $0 > pivot }

  return quicksort1(less) + equal + quicksort1(greater)
}

var array1 = [1, 9, 2, 8, 3, 7, 4, 6, 5]
let sorted1 = quicksort1(array1)
print(array1)
print(sorted1)


// 2.
func quicksort2(_ array: inout [Int], from start: Int, to end: Int) {
  if start < end {
    let partititon = partition(&array, from: start, to: end)
    quicksort2(&array, from: start, to: partititon-1)
    quicksort2(&array, from: partititon+1, to: end)
  }
}

func partition(_ array: inout [Int], from start: Int, to end: Int) -> Int {
  let pivot = array[end]
  
  var lessThanPivotIncrementer = start
  for value in start..<end {
    if array[value] <= pivot {
      array.swapAt(lessThanPivotIncrementer, value)
      lessThanPivotIncrementer += 1
    }
  }
  
  array.swapAt(lessThanPivotIncrementer, end)
  return lessThanPivotIncrementer
}

var array2 = [1, 9, 2, 8, 3, 7, 4, 6, 5]
print(array2)
quicksort2(&array2, from: 0, to: array2.count-1)
print(array2)
