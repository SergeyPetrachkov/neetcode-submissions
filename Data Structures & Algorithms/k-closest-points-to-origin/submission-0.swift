class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        // O(n log n) time
        // O(n) space
        let sortedByDistance = points.sorted(by: { firstPoint, secondPoint in
            let firstDistance = firstPoint[0]*firstPoint[0] + firstPoint[1]*firstPoint[1]
            let secondDistance = secondPoint[0]*secondPoint[0] + secondPoint[1]*secondPoint[1]
            return firstDistance < secondDistance
        })
        return Array(sortedByDistance.prefix(k))
    }
}
