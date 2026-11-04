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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        var result: [Int] = []
        var current: TreeNode? = root
        var stack: [TreeNode] = []

        while current != nil || !stack.isEmpty {
            if let node = current {
                stack.append(node)
                current = node.left
            } else {
                if let node = stack.popLast() {
                    result.append(node.val)
                    current = node.right
                }
            }
        }

        return result
    }
}
