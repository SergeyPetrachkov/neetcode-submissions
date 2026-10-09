class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0
      /*  
      k = 0
      i = 0  
        3 2 2 3
        ^
      k = 0
      i = 1
        3 2 2 3
          ^
      swap(num[i], num[k])
      k++

      k = 1         
      i = 2
        2 3 2 3
            ^
      swap(num[i], num[k])
      k++

      k = 2         
      i = 3
        2 2 3 3
              ^
      */

        for i in 0..<nums.count {
            if nums[i] != val {
                let temp = nums[k]
                nums[k] = nums[i]
                nums[i] = temp
                k += 1
            }
        }
        return k
    }
}
