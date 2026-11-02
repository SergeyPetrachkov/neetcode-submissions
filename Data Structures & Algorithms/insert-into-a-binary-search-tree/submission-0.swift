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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root else { 
            return TreeNode(val)
        }

        if val > root.val { // we go right
            root.right = insertIntoBST(root.right, val)
        } else { // we go left and we don't care about ==, because it is guaranteed that the new value does not exist in the original BST.
            root.left = insertIntoBST(root.left, val)
        }
        return root
    }
}
