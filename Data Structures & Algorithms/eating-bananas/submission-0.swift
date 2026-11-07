class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let guaranteedSpeed = piles.max()! // piles are not empty by the problem statement
        var result: Int = guaranteedSpeed
        var left: Int = 1
        var right: Int = guaranteedSpeed

        while left <= right {
            let k = (left + right) / 2
            var time = 0
            for pile in piles {
                time += (pile / k) + (pile % k > 0 ? 1 : 0)
            }
            if time <= h {
                result = min(result, k)
                right = k - 1
            } else {
                left = k + 1
            }
        }

        return result
    }
}
