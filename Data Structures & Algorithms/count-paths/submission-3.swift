class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let minDimension = min(m, n)
        let maxDimension = max(m, n)
        var cache = Array<Int>(repeating: 1, count: minDimension)
        for _ in 0..<maxDimension - 1 {
            for column in (0..<minDimension - 1).reversed() {
                cache[column] += cache[column + 1]
            }
        }
        return cache[0]
    }
}
