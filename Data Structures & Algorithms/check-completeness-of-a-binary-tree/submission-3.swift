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
            if let left = node.left {
                if shouldLookOutForNils { return false }
                queue.append(left)
            } else {
                shouldLookOutForNils = true
            }
            if let right = node.right {
                if shouldLookOutForNils { return false }
                queue.append(right)
            } else {
                shouldLookOutForNils = true
            }
        }
        return true
    }
}
