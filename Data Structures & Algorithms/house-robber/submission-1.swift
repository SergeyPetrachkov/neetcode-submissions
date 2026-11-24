class Solution {
    func rob(_ nums: [Int]) -> Int {
        var prev = 0
        var prevPrev = 0
        for i in nums.indices.reversed() {
            let nextResult = max(prev, nums[i] + prevPrev)
            prevPrev = prev
            prev = nextResult
        }
        return prev
    }
}