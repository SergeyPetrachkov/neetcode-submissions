class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        let lastIndex = nums.count - 1
        var right = lastIndex

        var mid: Int = -1
        while left <= right {
            mid = left + (right - left) / 2
            if ((mid - 1 < 0) || nums[mid] != nums[mid - 1]) && ((mid + 1 > lastIndex) || nums[mid] != nums[mid + 1]) {
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
