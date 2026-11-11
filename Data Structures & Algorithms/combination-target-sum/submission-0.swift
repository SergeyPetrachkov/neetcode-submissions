class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var sum: Int = 0

        func dfs(_ index: Int, target: Int) {
            if sum == target {
                return result.append(current)
            }
            if sum > target || index >= nums.count {
                return
            }
 
            current.append(nums[index])
            sum += nums[index]
            dfs(index, target: target)

            let last = current.removeLast()
            sum -= last
            dfs(index + 1, target: target)
        }

        dfs(0, target: target)
        return result
    }
}
