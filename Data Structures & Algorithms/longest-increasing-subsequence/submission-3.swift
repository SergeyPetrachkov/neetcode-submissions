class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dpLIS = Array<Int>(repeating: 1, count: nums.count)
        for i in nums.indices.reversed() {
            for j in (i + 1)..<nums.count {
                if nums[i] < nums[j] {
                    dpLIS[i] = max(dpLIS[i], 1 + dpLIS[j])
                }
            }
        }

        return dpLIS.max()!
    }
}
