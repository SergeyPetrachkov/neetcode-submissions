class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0
        nums = nums.filter { $0 != val }
        k = nums.count
        return k
    }
}
