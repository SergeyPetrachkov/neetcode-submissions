/**
 * Forward declaration of guess API.
 * @param  num   your guess
 * @return       -1 if num is higher than the picked number
 *                1 if num is lower than the picked number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n

        while left <= right {
            let mid = left + (right - left) / 2
            switch guess(mid) {
            case 1: 
                left = mid + 1
            case -1:
                right = mid - 1
            case 0:
                return mid
            default:
                break
            }
        }

        return -1
    }
}
