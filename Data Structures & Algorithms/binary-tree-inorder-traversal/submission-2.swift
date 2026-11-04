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
        var resultArray: [Int] = []

        func inorder(_ root: TreeNode?) {
            guard let root else {
                return
            }
            inorder(root.left)
            resultArray.append(root.val)
            inorder(root.right)
        }
        
        inorder(root)

        return resultArray
    }
}
