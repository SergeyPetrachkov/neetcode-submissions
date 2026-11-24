class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        var visited: Set<[Int]> = []
        
        func dfs(_ row: Int, _ column: Int) -> Int {
            if 
                (row < 0 || row >= grid.count)
                || (column < 0 || column >= grid[row].count)
                || visited.contains([row, column])
                || grid[row][column] == 0 
            {
                return 0
            }
            visited.insert([row, column])
            return 1 + dfs(row + 1, column) + dfs(row - 1, column) + dfs(row, column + 1) + dfs(row, column - 1)
        }

        for row in grid.indices {
            for column in grid[row].indices {
                maxArea = max(maxArea, dfs(row, column))
            }
        }

        return maxArea
    }
}
