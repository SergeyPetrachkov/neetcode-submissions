/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node else {
            return nil
        }

        var oldToNewMap: [Int: Node] = [:]

        func dfs(_ node: Node?) -> Node? {
            guard let node else {
                return nil
            }
            let newNode = Node(node.val)
            oldToNewMap[node.val] = newNode

            for neighbor in node.neighbors {
                if let neighbor, let existingClone = oldToNewMap[neighbor.val] {
                    newNode.neighbors.append(existingClone)
                } else {
                    newNode.neighbors.append(dfs(neighbor))
                }
            }
            return newNode
        }

        let clone = dfs(node)
        return clone
    }
}
