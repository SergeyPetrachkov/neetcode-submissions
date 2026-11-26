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
        guard let p, let q, p.val == q.val else {
            return false
        }
        var queue: Deque<(p: TreeNode?, q: TreeNode?)> = [(p: p, q: q)]
        
        while let pair = queue.popFirst() {
            if pair.p == nil && pair.q == nil {
                continue
            }
            if pair.p?.val != pair.q?.val {
                return false
            }
            queue.append((p: pair.p?.left, q: pair.q?.left))
            queue.append((p: pair.p?.right, q: pair.q?.right))
        }

        return true
    }
}
