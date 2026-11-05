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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else {
            return []
        }
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        var head = 0
        queue.append(root)

        while head < queue.count {
            let nodesToProcessCount = queue.count - head
            var valuesOnTheLevel: [Int] = []
            for _ in 0..<nodesToProcessCount {
                let node = queue[head]
                head += 1
                valuesOnTheLevel.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(valuesOnTheLevel)
        }

        return result
    }
}
