impl Solution {
    pub fn climb_stairs(n: i32) -> i32 {
        let mut oneStepBack = 1;
        let mut twoStepBack = 1;
        // 1 2 3 4 5
        //       ^ ^
        //       o t

        for i in 0..n-1 {
            let tempStep = oneStepBack;
            oneStepBack = oneStepBack + twoStepBack;
            twoStepBack = tempStep;
        }

        return oneStepBack;
    }
}
