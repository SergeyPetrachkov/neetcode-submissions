class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var cache = Array<Int>(repeating: 0, count: obstacleGrid[0].count)
        cache[cache.count - 1] = 1
        for row in obstacleGrid.indices.reversed() {
            for column in obstacleGrid[row].indices.reversed() {
                if obstacleGrid[row][column] == 1 {
                    cache[column] = 0
                } else {
                    if column == cache.count - 1 {
                        continue
                    } else {
                        cache[column] += cache[column + 1]
                    }
                }
            }
        } 
        return cache[0]
    }
}
