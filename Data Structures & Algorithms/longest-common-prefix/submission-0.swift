class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = ""
        let anchorWord = Array(strs[0])
        for i in 0..<anchorWord.count {
            for word in strs {
                let wordArray = Array(word)
                if i >= wordArray.count || wordArray[i] != anchorWord[i] {
                    return result
                }
            }
            result += String(anchorWord[i])
        }

        return result
    }
}
