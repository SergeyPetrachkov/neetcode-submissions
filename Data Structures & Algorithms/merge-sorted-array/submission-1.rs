impl Solution {
    pub fn merge(nums1: &mut Vec<i32>, m: i32, nums2: &mut Vec<i32>, n: i32) {
        let mut firstCursor = m - 1;
        let mut secondCursor = n - 1;
        let mut writeCursor = m + n - 1;

        while secondCursor >= 0 {
            if firstCursor >= 0 && nums1[firstCursor as usize] > nums2[secondCursor as usize] {
                nums1[writeCursor as usize] = nums1[firstCursor as usize];
                firstCursor -= 1;
            } else {
                nums1[writeCursor as usize] = nums2[secondCursor as usize];
                secondCursor -= 1;
            }
            writeCursor -= 1;
        }
    }
}
