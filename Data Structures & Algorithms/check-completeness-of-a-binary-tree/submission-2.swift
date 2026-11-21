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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root else {
            return false
        }
        var queue = Deque<TreeNode>()
        queue.append(root)
        var shouldLookOutForNils = false
        while let node = queue.popFirst() {
            if node.right != nil && node.left == nil {
                return false
            }
            if shouldLookOutForNils && (node.left != nil || node.right != nil) {
                return false
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
            if node.left == nil && node.right == nil {
                shouldLookOutForNils = true
            }
        }
        return true
    }
}
