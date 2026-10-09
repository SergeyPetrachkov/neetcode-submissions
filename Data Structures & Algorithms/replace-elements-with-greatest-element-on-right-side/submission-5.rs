impl Solution {
    pub fn replace_elements(arr: Vec<i32>) -> Vec<i32> {
        let mut current_max = -1;
        let mut array = arr;
        for i in (0..array.len()).rev() {
            let original = array[i];
            array[i] = current_max;
            current_max = max(current_max, original)
        }
        return array;
    }
}
