class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap: Heap<Int> = Heap(stones)
        while heap.count > 1 {
            let firstMax = heap.popMax()!
            let secondMax = heap.popMax()!

            let difference = firstMax - secondMax
            if difference > 0 {
                heap.insert(difference)
            }
        }
        return heap.max ?? 0
    }
}
