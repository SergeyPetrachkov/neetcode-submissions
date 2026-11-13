class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>()

        for num in nums {
            if heap.count < k {
                heap.insert(num)
            } else {
                if let min = heap.min, num > min {
                    heap.insert(num)
                    if heap.count > k {
                        heap.popMin()
                    }
                }
            }
        }

        return heap.min ?? 0
    }
}
