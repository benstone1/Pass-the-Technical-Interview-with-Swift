import Foundation

func binarySearch<T: Comparable>(for key: T, in arr: [T], withRange range: Range<Int>) -> Int? {
  guard range.lowerBound < range.upperBound else {
    return nil
  }

  let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
  if arr[midIndex] == key {
    return midIndex
  }

  let newRange: Range<Int>
  if arr[midIndex] < key {
     newRange = midIndex + 1 ..< range.upperBound
  } else {
     newRange = range.lowerBound ..< midIndex
  }
  return binarySearch(for:key, in:arr, withRange:newRange)
}

let data = [1, 14, 23, 33, 56, 100, 110, 125, 140]
print("\(binarySearch(for:23, in:data, withRange:0 ..< data.count)!)")
