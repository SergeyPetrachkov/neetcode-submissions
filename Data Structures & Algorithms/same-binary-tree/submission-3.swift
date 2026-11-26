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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil {
                return true
            }
            guard let p, let q else {
                return false
            }
            if p.val == q.val {
                return dfs(p.left, q.left) && dfs(p.right, q.right)
            } else {
                return false
            }
        }
        return dfs(p, q)
    }
}
