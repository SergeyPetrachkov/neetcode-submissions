class Solution {
    
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var zeroes = 0
        var ones = 0
        for student in students {
            // we know it's either 1 or 0
            if student == 0 {
                zeroes += 1
            } else {
                ones += 1
            }
        }

        for sandwich in sandwiches {
            if sandwich == 0 && zeroes > 0 {
                zeroes -= 1
            } else if sandwich == 1 && ones > 0 {
                ones -= 1
            } else {
                return zeroes + ones
            }
        }
        return 0
    }
}

