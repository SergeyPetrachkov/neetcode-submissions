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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var currentHead = head
        var previousHead: ListNode? = nil
        while currentHead != nil {
            let nextTemp = currentHead?.next
            currentHead?.next = previousHead
            previousHead = currentHead
            currentHead = nextTemp
        }
        return previousHead
    }
}
