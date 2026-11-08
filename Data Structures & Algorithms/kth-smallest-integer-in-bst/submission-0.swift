/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var result = Int.min
        var currentIndex = 0
        func dfs(_ root: TreeNode?) {
            guard let root else {
                return
            }
            dfs(root.left)
            currentIndex += 1
            if currentIndex == k {
                result = root.val
                return
            }
            dfs(root.right)
        }
        dfs(root)
        return result
    }
}
