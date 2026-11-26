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
        if p == nil && q == nil {
            return true
        }
        guard let p, let q else {
            return false
        }
        var queue = Deque<(left: TreeNode, right: TreeNode)>()
        queue.append((left: p, right: q))

        while let pair = queue.popFirst() {
            if pair.left.val != pair.right.val {
                return false
            }
            if let leftLeftChild = pair.left.left, let rightLeftChild = pair.right.left {
                queue.append((left: leftLeftChild, right: rightLeftChild))
            } else {
                if (pair.left.left != nil && pair.right.left == nil) || (pair.left.left == nil && pair.right.left != nil) {
                    return false
                }
            }

            if let leftRightChild = pair.left.right, let rightRightChild = pair.right.right {
                queue.append((left: leftRightChild, right: rightRightChild))
            } else {
                if (pair.left.right != nil && pair.right.right == nil) || (pair.left.right == nil && pair.right.right != nil) {
                    return false
                }
            }
        }

        return true
    }
}
