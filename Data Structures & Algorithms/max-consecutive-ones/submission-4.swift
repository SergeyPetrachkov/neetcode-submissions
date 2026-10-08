class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        var maxSequenceLenght = 0
        var currentSequenceLenght = 0

        for num in nums {
            if num == 1 {
                currentSequenceLenght += 1
            } else {
                currentSequenceLenght = 0
            }
            maxSequenceLenght = max(maxSequenceLenght, currentSequenceLenght)
        }

        return maxSequenceLenght
    }
}
