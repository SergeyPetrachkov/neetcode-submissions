class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False

        counts: dict[str, int] = {}
        for char1, char2 in zip(s, t):
            counts[char1] = counts.get(char1, 0) + 1
            counts[char2] = counts.get(char2, 0) - 1
        return all(value == 0 for value in counts.values())
        