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

        queue.append(root)

        while !queue.isEmpty {
            let nodesToProcessCount = queue.count
            var valuesOnTheLevel: [Int] = []
            for _ in 0..<nodesToProcessCount {
                let node = queue.removeFirst()
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
