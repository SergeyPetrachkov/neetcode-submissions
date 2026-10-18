class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let lowercased = s.lowercased()
        guard !lowercased.isEmpty else { return true }
        var h = lowercased.startIndex
        var t = lowercased.index(before: lowercased.endIndex)
        
        while h < t {
            if !(lowercased[h].isLetter || lowercased[h].isNumber) {
                h = lowercased.index(after: h)
                continue
            }
            if !(lowercased[t].isLetter || lowercased[t].isNumber) {
                t = lowercased.index(before: t)
                continue
            }
            if lowercased[h] == lowercased[t] {
                h = lowercased.index(after: h)
                t = lowercased.index(before: t)
            } else {
                return false
            }
        }
        return true
    }
}
