class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var xored = nums.count

        for i in 0..<nums.count {
            xored ^= i ^ nums[i]
        }

        return xored
    }
}
