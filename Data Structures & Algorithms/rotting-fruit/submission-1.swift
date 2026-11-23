class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var minutes = 0
        var freshFruit = 0
        var queue = Deque<(Int, Int)>()
        
        for row in grid.indices {
            for column in grid[0].indices {
                if grid[row][column] == 1 {
                    freshFruit += 1
                }
                if grid[row][column] == 2 {
                    queue.append((row, column))
                }
            }
        }

        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        while !queue.isEmpty && freshFruit > 0 {
            let queueLength = queue.count
            for i in 0..<queueLength {
                let (row, column) = queue.popFirst()!
                for direction in directions {
                    let nextRow = row + direction.0
                    let nextColumn = column + direction.1
                    if (nextRow < 0 || nextRow >= grid.count) 
                    || (nextColumn < 0 || nextColumn >= grid[nextRow].count)
                    || (grid[nextRow][nextColumn] != 1) {
                        continue
                    }
                    
                    grid[nextRow][nextColumn] = 2
                    freshFruit -= 1
                    queue.append((nextRow, nextColumn))
                }
            }

            minutes += 1
        }

        return freshFruit > 0 ? -1 : minutes
    }
}