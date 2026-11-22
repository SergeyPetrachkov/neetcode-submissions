class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        let lastIndex = nums.count - 1
        var right = lastIndex
        // search interval is always an odd number, and left < right guarantees that the search interval is not a single-element array
        while left < right {
            let mid = left + (right - left) / 2
            if (nums[mid] != nums[mid - 1]) && (nums[mid] != nums[mid + 1]) {
                return nums[mid]
            }

            if nums[mid] == nums[mid - 1] {
                let leftRemainder = mid - 1 - left
                if leftRemainder % 2 > 0 {
                    right = mid - 2
                } else {
                    left = mid + 1
                }
            } else {
                let rightRemainder = right - mid - 1
                if rightRemainder % 2 > 0 {
                    left = mid + 2
                } else {
                    right = mid - 1
                }
            }
        }

        return nums[left]
    }
}
