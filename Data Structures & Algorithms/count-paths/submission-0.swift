class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var cache: [[Int]] = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: n), count: m)

        // pre-processing last row filling columns 
        for column in cache[m - 1].indices {
            cache[m-1][column] = 1
        }
        // pre-processing last column filling rows
        for row in cache.indices {
            cache[row][n - 1] = 1
        }

        for row in cache.indices.dropLast().reversed() {
            for column in cache[row].indices.dropLast().reversed() {
                cache[row][column] = cache[row + 1][column] + cache[row][column + 1]
            }
        }

        return cache[0][0]
    }
}
