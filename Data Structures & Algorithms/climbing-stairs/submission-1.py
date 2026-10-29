class Solution:
    def climbStairs(self, n: int) -> int:
        # we start from the end
        # 1 2 3 4 5
        #       ^ ^
        #       1 1
        #       o t

        oneStepBack, twoStepBack = 1, 1

        for i in range(n - 1):
            tempNextStep = oneStepBack
            oneStepBack = oneStepBack + twoStepBack
            twoStepBack = tempNextStep
        
        return oneStepBack
