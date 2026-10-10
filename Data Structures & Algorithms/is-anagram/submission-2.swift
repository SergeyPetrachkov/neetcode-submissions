class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }

        var accumulatingDict: [Character: Int] = [:]

        for zipped in zip(s, t) {
            accumulatingDict[zipped.0, default: 0] += 1
            accumulatingDict[zipped.1, default: 0] -= 1
        }

        return accumulatingDict.allSatisfy { $0.value == 0 }
    }
}
