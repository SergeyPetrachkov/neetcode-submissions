class Solution {
    typealias NumberValue = Int
    typealias NumberIndex = Int
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var history: [NumberValue: NumberIndex] = [:]

        for i in 0..<nums.count {
            let diff = target - nums[i]
            if let index = history[diff] {
                return [index, i]
            } else {
                history[nums[i]] = i
            }
        }
        return []
    }
}
