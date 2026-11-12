class MinHeap {

    private var storage: [Int] = []

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

    func pop() -> Int {
        guard !storage.isEmpty else { return -1 }

        if storage.count == 1 {
            return storage.removeLast()
        }

        let top = self.top()

        let last = storage.removeLast()
        storage[0] = last
        var i = 0

        while i <= lastParentIndex() {
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

        return top
    }

    func top() -> Int {
        storage.isEmpty ? -1 : storage[0]
    }

    func heapify(_ nums: [Int]) {
        storage = nums
        guard !storage.isEmpty else { return }

        var lastParentIndex = self.lastParentIndex()

        while lastParentIndex >= 0 {
            var i = lastParentIndex
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
            lastParentIndex -= 1
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
