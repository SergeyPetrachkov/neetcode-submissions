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
        var isValid = true
        
        func dfs(_ root: TreeNode?, _ leftParentBoundary: Int, _ rightParentBoundary: Int) {
            guard let root else {
                return
            }
            if isValid && root.val > leftParentBoundary && root.val < rightParentBoundary {
                dfs(root.left, leftParentBoundary, root.val)
                dfs(root.right, root.val, rightParentBoundary)
            } else {
                isValid = false
            }
        }

        dfs(root, leftBoundary, rightBoundary)
        return isValid
    }
}
