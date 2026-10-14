class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        var pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]

        for char in s {
            switch char {
            case ")", "]", "}":
                if let last = stack.last, last == pairs[char] {
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
