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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else {
            return false
        }

        let remainder = targetSum - root.val
        return hasPathSum(root.left, remainder) || hasPathSum(root.right, remainder) || (root.left == nil && root.right == nil && remainder == 0)
    }
}
