class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = 0
        var sell = 1

        var currentMaxProfit = 0

        while sell < prices.count {
            let diff = prices[sell] - prices[buy]
            currentMaxProfit = max(currentMaxProfit, diff)
            if diff <= 0 {
                buy = sell
            }
            sell += 1
        }

        return currentMaxProfit
    }
}
