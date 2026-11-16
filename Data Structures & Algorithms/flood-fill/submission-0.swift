class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var grid = image
        func dfs(grid: inout [[Int]], row: Int, column: Int, desiredColor: Int, originalColor: Int) {
            guard !grid.isEmpty else {
                return
            }
            let rowsCount = grid.count
            let columnsCount = grid[0].count

            if row < 0 || column < 0 || row >= rowsCount || column >= columnsCount {
                return
            }

            if grid[row][column] != originalColor {
                return
            }

            if grid[row][column] == desiredColor {
                return
            }

            let ogColor = grid[row][column]
            grid[row][column] = desiredColor

            dfs(grid: &grid, row: row + 1, column: column, desiredColor: desiredColor, originalColor: ogColor)
            dfs(grid: &grid, row: row - 1, column: column, desiredColor: desiredColor, originalColor: ogColor)
            dfs(grid: &grid, row: row, column: column + 1, desiredColor: desiredColor, originalColor: ogColor)
            dfs(grid: &grid, row: row, column: column - 1, desiredColor: desiredColor, originalColor: ogColor)
        }

        dfs(grid: &grid, row: sr, column: sc, desiredColor: color, originalColor: image[sr][sc])
        return grid
    }
}
