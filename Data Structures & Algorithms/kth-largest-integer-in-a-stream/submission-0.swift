class KthLargest {
    private let k: Int
    private let heap: MinHeap
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.heap = MinHeap()
        for num in nums {
            self.add(num)
        }
    }

    func add(_ val: Int) -> Int {
        if heap.count < k {
            heap.push(val)
        } else {
            if let min = heap.peek(), val > min {
                heap.pop()
                heap.push(val)
            }
        }
        return heap.peek()!
    }

    class MinHeap {

        private var storage: [Int] = []

        var count: Int {
            storage.count
        }

        func push(_ value: Int) {
            storage.append(value)
            var i = storage.count - 1

            while i > 0 {
                let parentIndex = parentIndex(for: i)
                if storage[i] < storage[parentIndex] {
                    storage.swapAt(i, parentIndex)
                    i = parentIndex
                } else {
                    break
                }
            }
        }

        @discardableResult
        func pop() -> Int? {
            guard !storage.isEmpty else { return nil }

            if storage.count == 1 {
                return storage.removeLast()
            }

            let top = self.peek()!

            let last = storage.removeLast()
            storage[0] = last

            siftDown(from: 0)

            return top
        }

        func peek() -> Int? {
            storage.first
        }

        func heapify(_ nums: [Int]) {
            storage = nums
            guard storage.count > 1 else { return }

            var lastParentIndex = self.lastParentIndex()

            while lastParentIndex >= 0 {
                siftDown(from: lastParentIndex)
                lastParentIndex -= 1
            }
        }

        private func siftDown(from index: Int) {
            var i = index
            while i <= self.lastParentIndex() {
                let leftChildIndex = self.leftChildIndex(for: i)
                let rightChildIndex = self.rightChildIndex(for: i)
                let smallestChildIndex = if rightChildIndex < storage.count {
                    storage[leftChildIndex] <= storage[rightChildIndex] ? leftChildIndex : rightChildIndex
                } else {
                    leftChildIndex
                }
                if storage[i] <= storage[smallestChildIndex] {
                    break
                } else {
                    storage.swapAt(i, smallestChildIndex)
                    i = smallestChildIndex
                }
            }
        }

        private func leftChildIndex(for i: Int) -> Int {
            2 * i + 1
        }

        private func rightChildIndex(for i: Int) -> Int {
            2 * i + 2
        }

        private func parentIndex(for i: Int) -> Int {
            (i - 1) / 2
        }

        private func lastParentIndex() -> Int {
            storage.count / 2 - 1
        }
    }
}
