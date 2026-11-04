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
        var resultArray: [Int] = []
        guard let root else {
            return []
        }

        resultArray.append(contentsOf: inorderTraversal(root.left))
        resultArray.append(root.val)
        resultArray.append(contentsOf: inorderTraversal(root.right))
        return resultArray
    }
}
