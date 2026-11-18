class Solution {

    struct Cell: Hashable {
        let row: Int
        let column: Int

        init(_ row: Int, _ column: Int) {
            self.row = row
            self.column = column
        }
    }

    func shortestPathBinaryMatrix(_ grid: inout [[Int]]) -> Int {
        let rows = grid.count
        let columns = grid[0].count
        if grid[0][0] == 1 {
            return -1
        }
        let firstCell = Cell(0, 0)
        var queue = Deque<(cell: Cell, length: Int)>()
        var visited: Set<Cell> = [firstCell]
        queue.append((cell: firstCell, length: 1))

        let directions = [
            (0, 1), (0, -1), (1, 0), (-1, 0),
            (1, 1), (-1, 1), (-1, -1), (1, -1)
        ]

        while let (cell, length) = queue.popFirst() {
            if cell.row == rows - 1 && cell.column == columns - 1 {
               return length
            }
            for direction in directions {

                let newRow = cell.row + direction.0
                let newColumn = cell.column + direction.1

                if 
                    (newRow < 0 || newRow >= rows) || (newColumn < 0 || newColumn >= columns)
                {
                    continue
                }
                
                let cell = Cell(newRow, newColumn)

                if grid[newRow][newColumn] == 1 || visited.contains(cell) {
                    continue
                }
                visited.insert(cell)
                queue.append((cell: cell, length: length + 1))
            }
        }
        return -1
    }
}