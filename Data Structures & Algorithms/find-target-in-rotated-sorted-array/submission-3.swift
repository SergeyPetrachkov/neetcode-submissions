class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if target == nums[mid] {
                return mid
            }
            if target == nums[left] {
                return left
            }
            if target == nums[right] {
                return right
            }

            if target < nums[mid] {
                if nums[left] < nums[mid] && target > nums[left] {
                    right = mid - 1
                    left += 1
                } else {
                    left += 1
                }
            } else {
                if nums[right] > nums[mid] && target < nums[right] {
                    left = mid + 1
                    right -= 1
                } else {
                    right -= 1
                }
            }
        }
        return -1
    }
}
