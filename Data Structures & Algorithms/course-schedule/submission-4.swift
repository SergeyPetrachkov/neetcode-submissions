class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // preprocessing aka adj map/list

        var adjMap: [Int: [Int]] = [:]
        for edge in prerequisites {
            adjMap[edge[0], default: []].append(edge[1])
        }
        var visiting = Set<Int>()
        var visited = Set<Int>()
        // dfs
        var stack: [(node: Int, exiting: Bool)] = []
        
        for node in 0..<numCourses {
            if visited.contains(node) {
                continue
            }

            stack.append((node: node, exiting: false))

            while let (popped, exiting) = stack.popLast() {
                if exiting {
                    visiting.remove(popped)
                    visited.insert(popped)
                } else {
                    if visiting.contains(popped) {
                        return false
                    }
                    if visited.contains(popped) {
                        continue
                    }
                    visiting.insert(popped)
                    stack.append((node: popped, exiting: true))
                    if let connectedNodes = adjMap[popped] {
                        for connectedNode in connectedNodes {
                            if visiting.contains(connectedNode) {
                                return false
                            }
                            stack.append((node: connectedNode, exiting: false))
                        }
                    }
                }
            }
        }

        return true
    }
}
