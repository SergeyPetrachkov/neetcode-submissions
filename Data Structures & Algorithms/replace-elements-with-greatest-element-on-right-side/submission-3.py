class Solution:
    def replaceElements(self, arr: List[int]) -> List[int]:
        # 2 4 5 3 1 2
        # _ _ _ _ _ -1

        # i = 4
        # 2 4 5 3 1 2
        # _ _ _ _ 2 -1
        #         ^

        # i = 3
        # 2 4 5 3 1 2
        # _ _ _ 2 2 -1
        #       ^

        # i = 2
        # 2 4 5 3 1 2
        # _ _ 3 2 2 -1
        #     ^

        # i = 1
        # 2 4 5 3 1 2
        # _ 5 3 2 2 -1
        #   ^
        
        # i = 0
        # 2 4 5 3 1 2
        # 5 5 3 2 2 -1
        # ^    
        resulting_array = [-1] * len(arr)
        for i in range(len(arr)-2, -1, -1):
            resulting_array[i] = max(arr[i + 1], resulting_array[i + 1])
        return resulting_array
        