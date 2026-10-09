impl Solution {
    pub fn replace_elements(arr: Vec<i32>) -> Vec<i32> {
        /*
        2 4 5 3 1 2
        _ _ _ _ _ -1

        i = 4
        2 4 5 3 1 2
        _ _ _ _ 2 -1
                ^

        i = 3
        2 4 5 3 1 2
        _ _ _ 2 2 -1
              ^

        i = 2
        2 4 5 3 1 2
        _ _ 3 2 2 -1
            ^

        i = 1
        2 4 5 3 1 2
        _ 5 3 2 2 -1
          ^
        
        i = 0
        2 4 5 3 1 2
        5 5 3 2 2 -1
        ^    
        */
        let mut resulting_array = vec![-1; arr.len()];
        for i in (0..arr.len().saturating_sub(1)).rev() {
            resulting_array[i] = max(resulting_array[i+1], arr[i+1]);
        }
        return resulting_array;
    }
}
