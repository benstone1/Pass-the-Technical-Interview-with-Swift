import Foundation

func binarySearch<T: Comparable>(array: [T], key: T) -> Int? {
  var lowerBound = 0
  var upperBound = array.count
  
  while lowerBound < upperBound {
    let midIndex = lowerBound + (upperBound - lowerBound) / 2

    switch array[midIndex] {
      case _ where array[midIndex] == key:
        return midIndex
      case _ where array[midIndex] < key:
        lowerBound = midIndex + 1
      default:
        upperBound = midIndex
    }

/*
    if array[midIndex] == key {
      return midIndex
    } else if array[midIndex] < key {
      lowerBound = midIndex + 1
    } else {
      upperBound = midIndex
    }*/
  }
  
  return nil
}

func binarySearch2<T: Comparable>(array: [T], key: T, range: Range<Int>) -> Int? {
  if range.lowerBound >= range.upperBound {
    return nil
  } else {
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    switch array[midIndex] {
      case _ where array[midIndex] > key:
        return binarySearch2(array: array, key: key, range: range.lowerBound ..< midIndex)
      case _ where array[midIndex] < key:
        return binarySearch2(array: array, key: key, range: midIndex + 1 ..< range.upperBound)
      default:
        return midIndex
    }
    
   /* if array[midIndex] > key {
      return binarySearch2(array: array, key: key, range: range.lowerBound ..< midIndex)
    } else if array[midIndex] < key {
      return binarySearch2(array: array, key: key, range: (midIndex + 1)..<range.upperBound)
    } else {
      return midIndex
    }*/
  }
}


let data = [1, 14, 23, 33, 56, 100, 110, 125, 140]
print("\(binarySearch2(array:data, key:140, range: 0 ..< data.count)!)")
