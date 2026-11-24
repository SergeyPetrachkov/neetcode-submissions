class Solution {
    func rob(_ nums: [Int]) -> Int {
        var cache = Array<Int?>(repeating: nil, count: nums.count)
        func robFrom(_ index: Int) -> Int {
            guard index < nums.count else {
                return 0
            }
            if let cached = cache[index] {
                return cached
            }
            let rob = nums[index] + robFrom(index + 2)
            let skip = robFrom(index + 1)
            let max = max(rob, skip)
            cache[index] = max
            return max
        }
        return robFrom(0)
    }
}