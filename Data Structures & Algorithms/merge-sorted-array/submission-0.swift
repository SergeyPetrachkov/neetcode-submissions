class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var firstCursor = m - 1
        var secondCursor = n - 1
        var writeCursor = m + n - 1 // or nums1.count - 1

        // [10, 20, 30, 40, 50, 0, 0]
        // [1, 2]

        // [10, 20, 30, 40, 50, 0, 0]
        // [100, 200]

        while secondCursor >= 0 {
            if firstCursor >= 0 && nums1[firstCursor] > nums2[secondCursor] {
                nums1[writeCursor] = nums1[firstCursor]
                firstCursor -= 1
            } else {
                nums1[writeCursor] = nums2[secondCursor]
                secondCursor -= 1
            }
            writeCursor -= 1
        }
    }
}
