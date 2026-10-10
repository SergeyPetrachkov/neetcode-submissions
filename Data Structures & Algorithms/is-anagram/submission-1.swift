class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }

        var accumulatingDictS: [Character: Int] = [:]
        var accumulatingDictT: [Character: Int] = [:]

        for zipped in zip(s, t) {
            accumulatingDictS[zipped.0, default: 0] += 1
            accumulatingDictT[zipped.1, default: 0] += 1
        }
        // naive with 2 dictionaries
        return accumulatingDictS == accumulatingDictT//accumulatingDict.allSatisfy { $0.value % 2 == 0 }
    }
}
