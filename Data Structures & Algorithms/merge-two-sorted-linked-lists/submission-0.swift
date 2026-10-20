/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var tail = dummy

        var l1 = list1
        var l2 = list2

        while let left = l1, let right = l2 {
            if left.val < right.val {
                tail.next = left // attach
                l1 = left.next // advance the pointer
            } else {
                tail.next = right
                l2 = right.next
            }
            tail = tail.next!
        }

        tail.next = l1 ?? l2

        return dummy.next
    }
}
