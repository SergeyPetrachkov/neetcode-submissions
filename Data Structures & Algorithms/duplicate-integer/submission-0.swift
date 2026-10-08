class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        let unique = Set(nums)
        return unique.count != nums.count
    }
}
