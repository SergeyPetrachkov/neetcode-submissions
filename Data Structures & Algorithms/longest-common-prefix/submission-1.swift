class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var index = 0
        let anchorWord = Array(strs[0])
        for i in 0..<anchorWord.count {
            for word in strs {
                let wordArray = Array(word)
                if i >= wordArray.count || wordArray[i] != anchorWord[i] {
                    return String(anchorWord[0..<index])
                }
            }
            index += 1
        }

        return String(anchorWord[0..<index])
    }
}
