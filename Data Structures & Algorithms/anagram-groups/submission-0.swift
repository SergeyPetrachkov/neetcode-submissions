class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result: [[Int]: [String]] = [:]

        // preprocess
        for str in strs {
            var key = Array(repeating: 0, count: 26)
            for char in str {
                let index = Int(char.asciiValue! - Character("a").asciiValue!)
                key[index] += 1
            }
            result[key, default: []].append(str)
        }

        return Array(result.values)
    }
}
