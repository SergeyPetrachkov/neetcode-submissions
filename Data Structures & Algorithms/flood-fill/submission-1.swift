class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var grid = image
        func dfs(row: Int, column: Int) {

            if row < 0 || column < 0 || row >= rowsCount || column >= columnsCount {
                return
            }

            if grid[row][column] != originalColor {
                return
            }

            grid[row][column] = color

            dfs(row: row + 1, column: column)
            dfs(row: row - 1, column: column)
            dfs(row: row, column: column + 1)
            dfs(row: row, column: column - 1)
        }

        let originalColor = image[sr][sc]
        let rowsCount = grid.count
        let columnsCount = grid[0].count

        if grid[sr][sc] == color {
            return grid
        }

        dfs(row: sr, column: sc)
        return grid
    }
}
