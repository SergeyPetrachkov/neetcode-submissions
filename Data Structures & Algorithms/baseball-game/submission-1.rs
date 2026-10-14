impl Solution {
    pub fn cal_points(operations: Vec<String>) -> i32 {
        let mut stack: Vec<i32> = Vec::new();
        for operation in operations {
            match operation.as_str() {
                "+" =>  { stack.push(stack[stack.len() - 1] + stack[stack.len() - 2]); }
                "C" => { stack.pop(); }
                "D" => { 
                    let value = stack[stack.len() - 1] * 2; 
                    stack.push(value); 
                }
                _ =>  { 
                    let value = operation.parse::<i32>().unwrap();
                    stack.push(value); 
                }
            }
        }

        return stack.iter().sum();
    }
}
