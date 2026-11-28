class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var text1 = Array(text1)
        var text2 = Array(text2)
        struct Coordinates: Hashable {
            let i: Int
            let j: Int

            init(_ i: Int, _ j: Int) {
                self.i = i
                self.j = j
            }
        }
        var cache: [Coordinates: Int] = [:]

        func dfs(_ i: Int, _ j: Int) -> Int {
            if i == text1.count || j == text2.count {
                return 0
            }
            if let computed = cache[Coordinates(i, j)] {
                return computed
            }

            if text1[i] == text2[j] {
                cache[Coordinates(i, j), default: 0] += 1
                cache[Coordinates(i, j), default: 0] += dfs(i + 1, j + 1)
            } else {
                cache[Coordinates(i, j), default: 0] += max(dfs(i + 1, j), dfs(i, j + 1))
            }

            return cache[Coordinates(i, j), default: 0]
        }

        return dfs(0, 0)
    }
}
