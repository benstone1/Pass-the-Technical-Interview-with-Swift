func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var mergedArray = [Int]()
    var leftCopy = leftArray
    var rightCopy = rightArray

    while leftCopy.count > 0 && rightCopy.count > 0 {
        let nextValue = leftCopy.first! < rightCopy.first! ? leftCopy.removeFirst() : rightCopy.removeFirst()
        mergedArray.append(nextValue)
    }

    return mergedArray + leftCopy + rightCopy
}

func mergeSort(_ inputArray: [Int]) -> [Int] {
    guard inputArray.count > 1 else {
        return inputArray
    }

    let midIndex = inputArray.count/2
    let leftArray = Array(inputArray[0..<midIndex])
    let rightArray = Array(inputArray[midIndex..<inputArray.count])

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

