class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var total = (nums.count * (nums.count + 1))/2

        for num in nums {
            total -= num
        }

        return total
    }
}
