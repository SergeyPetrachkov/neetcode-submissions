class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []

        for char in s {
            switch char {
            case ")":
                if let last = stack.last, last == "(" {
                    stack.removeLast()
                } else {
                    return false
                }
            case "]":
                if let last = stack.last, last == "[" {
                    stack.removeLast()
                } else {
                    return false
                }
            case "}":
                if let last = stack.last, last == "{" {
                    stack.removeLast()
                } else {
                    return false
                }
            default:
                stack.append(char)
            }
        }

        return stack.isEmpty
    }
}
