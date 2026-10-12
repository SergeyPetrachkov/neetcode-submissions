class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = Array(repeating: 0, count: n * 2)
        for i in 0..<nums.count {
            ans[i] = nums[i]
            ans[i + n] = nums[i]
        }
        return ans
    }
}
