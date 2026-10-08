class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        current_len = 0
        max_len = 0
        for num in nums:
            if num == 1:
                current_len += 1
            else:
                current_len = 0
            max_len = max(max_len, current_len)
        return max_len