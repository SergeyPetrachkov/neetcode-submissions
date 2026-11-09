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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty, !inorder.isEmpty else {
            return nil
        }
        var inorderIndexMap: [Int: Int] = [:]
        for element in inorder.enumerated() {
            inorderIndexMap[element.1] = element.0
        }
        var preorderIndex = 0

        func build(_ left: Int, _ right: Int) -> TreeNode? {
            guard left <= right else {
                return nil
            }
            let nodeValue = preorder[preorderIndex]
            let node = TreeNode(nodeValue)
            let index = inorderIndexMap[nodeValue]!
            preorderIndex += 1
            node.left = build(left, index - 1)
            node.right = build(index + 1, right)
            return node
        }

        return build(0, inorder.count - 1)
    }
}
