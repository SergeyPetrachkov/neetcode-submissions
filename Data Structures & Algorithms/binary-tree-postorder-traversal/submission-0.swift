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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }

        var stack: [TreeNode] = []
        var current: TreeNode? = root
        var lastVisited: TreeNode? = nil
        var result: [Int] = []

        while current != nil || !stack.isEmpty {
            if let node = current {
                stack.append(node)
                current = node.left
            } else {
                let lastInStack = stack.last
                if lastInStack?.right == nil || lastInStack?.right === lastVisited {
                    let popped = stack.popLast()
                    result.append(popped!.val)
                    lastVisited = popped
                } else {
                    current = lastInStack?.right
                }
            }
        }

        return result
    }    
}
