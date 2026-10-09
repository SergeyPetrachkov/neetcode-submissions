class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        // naive implementation
        var resultingArray = arr
        for i in 0..<arr.count - 1 {
            var currentRightMax = arr[i+1...arr.count-1].max() ?? -1
            resultingArray[i] = currentRightMax
        }
        resultingArray[resultingArray.count - 1] = -1
        return resultingArray
    }
}
