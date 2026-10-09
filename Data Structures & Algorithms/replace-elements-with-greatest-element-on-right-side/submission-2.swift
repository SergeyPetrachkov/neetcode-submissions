class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        // more interesting implementation
        var resultingArray = Array(repeating: -1, count: arr.count)
        /*
        2 4 5 3 1 2
        _ _ _ _ _ -1

        i = 4
        2 4 5 3 1 2
        _ _ _ _ 2 -1
                ^

        i = 3
        2 4 5 3 1 2
        _ _ _ 2 2 -1
              ^

        i = 2
        2 4 5 3 1 2
        _ _ 3 2 2 -1
            ^

        i = 1
        2 4 5 3 1 2
        _ 5 3 2 2 -1
          ^
        
        i = 0
        2 4 5 3 1 2
        5 5 3 2 2 -1
        ^    
        */

        for i in stride(from: arr.count - 2, through: 0, by: -1) {
            resultingArray[i] = max(arr[i+1], resultingArray[i + 1])
        }

        return resultingArray
    }
}
