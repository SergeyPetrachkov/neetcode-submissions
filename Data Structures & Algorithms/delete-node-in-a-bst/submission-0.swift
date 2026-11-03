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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root else {
            return nil
        }
        if root.val > key { // go left
            root.left = deleteNode(root.left, key)
        } else if root.val < key { // go right
            root.right = deleteNode(root.right, key)
        } else { // we found it
            if let left = root.left, let right = root.right { // complex case with 2 children
                // find min in the right
                let minNode = minNode(right)
                 // use that value to place as the root
                root.val = minNode.val
                // find the node with that value down the tree and remove it
                root.right = deleteNode(root.right, minNode.val)
            } else { // we have 0 or 1 child
                let child = root.left ?? root.right
                return child
            }
        }
        return root
    }

    private func minNode(_ root: TreeNode) -> TreeNode {
        var current: TreeNode = root
        while let left = current.left {
            current = left
        }
        return current
    }
}
