impl Solution {
    pub fn find_max_consecutive_ones(nums: Vec<i32>) -> i32 {
        if nums.len() == 0 {
            return 0;
        }

        let mut currentSeqLen = 0;
        let mut maxSeqLen = 0;

        for num in nums {
            if num == 1 {
                currentSeqLen = (currentSeqLen + 1);
            } else {
                currentSeqLen = 0;
            }
            maxSeqLen = max(maxSeqLen, currentSeqLen);
        }
        return maxSeqLen;
    }
}
