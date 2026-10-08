class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var dictionary: [Int: Int] = [:]
        var hasDuplicates = false
        for num in nums {
            if dictionary[num] != nil {
                hasDuplicates = true
                break
            } else {
                dictionary[num, default: 0] += 1
            }
        }
        return hasDuplicates
    }
}
