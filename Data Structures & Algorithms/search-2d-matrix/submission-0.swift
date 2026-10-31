class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var leftRowIndex = 0
        var rightRowIndex = matrix.count - 1
        while leftRowIndex <= rightRowIndex {
            let midRowIndex = leftRowIndex + (rightRowIndex - leftRowIndex) / 2
            let midRow = matrix[midRowIndex]
            let firstRowElement = midRow[0]
            let lastRowElement = midRow[midRow.count - 1]

            if target < firstRowElement {
                rightRowIndex = midRowIndex - 1
            } else if target > lastRowElement {
                leftRowIndex = midRowIndex + 1
            } else if target == firstRowElement || target == lastRowElement {
                return true
            } else {
                return binarySearch(in: midRow, target: target)
            }
        }
        return false
    }

    private func binarySearch(in row: [Int], target: Int) -> Bool {
        var left = 0
        var right = row.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            if row[mid] > target {
                right = mid - 1
            } else if row[mid] < target {
                left = mid + 1
            } else {
                return true
            }
        }

        return false
    }
}
