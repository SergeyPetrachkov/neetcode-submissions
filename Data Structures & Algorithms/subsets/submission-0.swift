class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []

        func dfs(_ index: Int) {
            if index > nums.count - 1 {
                return result.append(current)
            }

            // we decide to append the number, left child
            current.append(nums[index])
            dfs(index + 1)

            // we decide not to append the number, right child
            current.removeLast()
            dfs(index + 1)
        }

        dfs(0)
        return result
    }
}
