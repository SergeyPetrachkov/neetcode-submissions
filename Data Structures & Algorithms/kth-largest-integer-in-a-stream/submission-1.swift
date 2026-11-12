class KthLargest {
    private let k: Int
    private var heap: Heap<Int>

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.heap = Heap<Int>()
        for num in nums {
            _ = self.add(num)
        }
    }

    func add(_ val: Int) -> Int {
        if heap.count < k {
            heap.insert(val)
        } else {
            if let min = heap.min, val > min {
                heap.popMin()
                heap.insert(val)
            }
        }
        return heap.min!
    }
}
