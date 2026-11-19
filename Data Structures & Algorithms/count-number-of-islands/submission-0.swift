class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var gridCopy = grid

        let rows = gridCopy.count
        let columns = gridCopy[0].count

        var islands = 0

        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)] // (row, column)
        for row in gridCopy.indices {
            for column in gridCopy[row].indices {
                if gridCopy[row][column] == "1" {
                    islands += 1
                    var queue = Deque<(Int, Int)>()
                    queue.append((row, column)) // we enqueue for processing
                    gridCopy[row][column] = "0" // we mark the current visited (kinda)
                    while let cell = queue.popFirst() {
                        for direction in directions {
                            let nextRow = cell.0 + direction.0
                            let nextColumn = cell.1 + direction.1
                            if 
                                (nextRow < rows && nextRow >= 0) 
                                && (nextColumn < columns && nextColumn >= 0)
                                && (gridCopy[nextRow][nextColumn] == "1")
                            {
                                queue.append((nextRow, nextColumn)) // we enqueue for processing
                                gridCopy[nextRow][nextColumn] = "0" // we mark the current visited (kinda)
                            }
                        }
                    }
                }
            }
        }
        return islands
    }
}
