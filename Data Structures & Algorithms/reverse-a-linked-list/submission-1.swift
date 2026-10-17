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
        var previous: ListNode? = nil // head to the reversed part
        var current = head // head of the unprocessed part
        while let node = current {
            let nextTemp = node.next // we preserve the remaining list
            node.next = previous // current.next should point to previous, attaching the reversed portion
            previous = node // current node becomes the new reversed head
            current = nextTemp // advance the current pointer to the next unprocessed node
        }
        return previous
    }
}
