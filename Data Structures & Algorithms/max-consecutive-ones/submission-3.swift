class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        var maxSequenceLenght = 0
        var currentSequenceLenght = 0

        for i in 0..<nums.count {
            if i == 0 {
                currentSequenceLenght = nums[i] == 1 ? 1 : 0
                maxSequenceLenght = currentSequenceLenght
            } else {
                if nums[i] == 1 {
                    if nums[i - 1] == 0 {
                        currentSequenceLenght = 1
                    } else {
                        currentSequenceLenght += 1
                    }
                    maxSequenceLenght = max(maxSequenceLenght, currentSequenceLenght)
                }
            }
        }

        return maxSequenceLenght
    }
}
