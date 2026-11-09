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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        var result: [Int] = []
        var queue = [root]
        var head = 0

        while head < queue.count {
            let countSnapshot = queue.count
            for _ in head..<countSnapshot {
                let node = queue[head]
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                head += 1
            }
            result.append(queue[countSnapshot - 1].val)
        }

        return result
    }
}
