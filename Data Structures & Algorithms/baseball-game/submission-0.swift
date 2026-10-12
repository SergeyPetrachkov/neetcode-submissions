class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var stack: [Int] = []
        for char in operations {
            switch char {
            case "C":
                _ = stack.popLast()
            case "D":
                stack.append(stack[stack.count - 1] * 2)
            case "+":
                let previous = stack[stack.count - 1]
                let prePrevious = stack[stack.count - 2] 
                stack.append(previous + prePrevious)
            default:
                if let num = Int(char) {
                    stack.append(num)
                }
            }
        }
        return stack.reduce(0, +)
    }

    private func integer(by index: Int, from operations: [String]) -> Int? {
        Int(operations[index])
    }
}
