class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var cache = Array<Int>(repeating: 1, count: n) // we're gonna take columns
        for row in (0..<m - 1).reversed() {
            for column in (0..<n - 1).reversed() {
                cache[column] += cache[column + 1]
            }
        }
        return cache[0]
    }
}
