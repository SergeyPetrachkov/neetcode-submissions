class Solution {
    func climbStairs(_ n: Int) -> Int {
        var oneStepBack = 1
        var twoStepBack = 1
        for i in 0..<n-1 {
            // temp value before shifting the pointer
            let nextStep = oneStepBack
            oneStepBack = oneStepBack + twoStepBack
            twoStepBack = nextStep
        }
        return oneStepBack
    }
}
