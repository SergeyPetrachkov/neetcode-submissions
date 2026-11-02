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
        var current: TreeNode? = root
        while current != nil {
            if val > current!.val { // go right
                if let right = current?.right {
                    current = right
                } else {
                    current?.right = TreeNode(val)
                    break
                }
            } else { // go left
                if let left = current?.left {
                    current = left
                } else {
                    current?.left = TreeNode(val)
                    break
                }
            }
        }

        return root
    }
}
