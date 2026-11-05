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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root else {
            return true
        }

        return dfs(root) != -1
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else {
                return 0
            }
            let leftHeight = dfs(node.left)
            if leftHeight < 0 {
                return -1
            }
            let rightHeight = dfs(node.right)
            if rightHeight < 0 {
                return -1
            }

            if abs(leftHeight - rightHeight) > 1 {
                return -1
            }
            return 1 + max(leftHeight, rightHeight)
        }
    }
}
