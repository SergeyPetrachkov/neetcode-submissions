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
    func isValidBST(_ root: TreeNode?) -> Bool {
        let leftBoundary = Int.min
        let rightBoundary = Int.max
        
        func dfs(_ root: TreeNode?, _ leftParentBoundary: Int, _ rightParentBoundary: Int) -> Bool {
            guard let root else {
                return true
            }
            guard root.val > leftParentBoundary && root.val < rightParentBoundary else {
                return false
            }
            return dfs(root.left, leftParentBoundary, root.val) && dfs(root.right, root.val, rightParentBoundary)
        }

        return dfs(root, leftBoundary, rightBoundary)
    }
}
