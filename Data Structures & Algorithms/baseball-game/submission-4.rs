impl Solution {
    pub fn cal_points(operations: Vec<String>) -> i32 {
        let mut stack: Vec<i32> = Vec::new();
        let mut result: i32 = 0;
        for operation in operations {
            match operation.as_str() {
                "+" =>  { 
                    let last = stack[stack.len() - 1];
                    let preLast = stack[stack.len() - 2];
                    let newValue = last + preLast;
                    stack.push(newValue);
                    result += newValue; 
                }
                "C" => { 
                    let removedValue = stack.pop();
                    result -= removedValue.unwrap();
                }
                "D" => { 
                    let newValue = stack[stack.len() - 1] * 2;
                    stack.push(newValue);
                    result += newValue;
                }
                _ =>  { 
                    let value = operation.parse::<i32>().unwrap();
                    stack.push(value);
                    result += value;
                }
            }
        }

        return result;
    }
}
