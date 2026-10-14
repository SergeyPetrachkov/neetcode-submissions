class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var stack: [Int] = []
        var result: Int = 0
        for char in operations {
            switch char {
            case "C":
                let removedValue = stack.popLast()
                result -= removedValue!
            case "D":
                let newValue = stack[stack.count - 1] * 2
                stack.append(newValue)
                result += newValue
            case "+":
                let previous = stack[stack.count - 1]
                let prePrevious = stack[stack.count - 2] 
                let newValue = previous + prePrevious
                stack.append(newValue)
                result += newValue
            default:
                if let num = Int(char) {
                    stack.append(num)
                    result += num
                }
            }
        }
        return result
    }
}
