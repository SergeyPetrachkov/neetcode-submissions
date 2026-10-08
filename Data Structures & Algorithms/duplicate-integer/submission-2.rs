impl Solution {
    pub fn has_duplicate(nums: Vec<i32>) -> bool {
        let mut seen: HashSet<i32> = nums.iter().copied().collect();
        return nums.len() > seen.len();
    }
}
