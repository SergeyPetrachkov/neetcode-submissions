class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap = MaxHeap()
        for point in points {
            heap.insert(point)
            if heap.count > k {
                heap.removeMax()
            }
        }
        return heap.elements
    }

    struct MaxHeap {
        private(set) var elements: [[Int]] = []

        var count: Int {
            elements.count
        }

        var peek: [Int]? {
            elements.first
        }

        mutating func insert(_ point: [Int]) {
            let newSquareDistance = squareDistance(of: point)
            elements.append(point)
            var currentIndex = count - 1
            while currentIndex > 0 {
                let parentIndex = (currentIndex - 1) / 2
                let parentDistance = self.squareDistance(of: elements[parentIndex])
                if newSquareDistance <= parentDistance {
                    break
                }
                elements.swapAt(parentIndex, currentIndex)
                currentIndex = parentIndex
            }
        }

        mutating func removeMax() -> [Int]? {
            // if we don't have anything there it's an empty array
            guard let root = peek else {
                return nil
            }

            elements.swapAt(0, count - 1)
            elements.removeLast()
            var currentIndex = 0
            while currentIndex < count {
                
                // these can overflow
                let leftChildIndex = 2 * currentIndex + 1
                let rightChildIndex = 2 * currentIndex + 2
                var candidateIndex = leftChildIndex
                // Because a heap is a complete binary tree, a node cannot have a right child without having a left child.
                if leftChildIndex >= count {
                    break
                }
                if rightChildIndex < count { // right exists
                    if squareDistance(of: elements[leftChildIndex]) < squareDistance(of: elements[rightChildIndex]) {
                        candidateIndex = rightChildIndex
                    }
                }
                let currentParentDistance = squareDistance(of: elements[currentIndex])
                if squareDistance(of: elements[candidateIndex]) > currentParentDistance {
                    elements.swapAt(currentIndex, candidateIndex)
                    currentIndex = candidateIndex
                } else {
                    break
                }
            }
            return root
        }

        private func squareDistance(of point: [Int]) -> Int {
            point[0]*point[0] + point[1]*point[1]
        }
    }
}

