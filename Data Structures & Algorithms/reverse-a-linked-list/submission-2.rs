// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//     pub val: i32,
//     pub next: Option<Box<ListNode>>,
// }
//
// impl ListNode {
//     #[inline]
//     pub fn new(val: i32) -> Self {
//         ListNode { next: None, val }
//     }
// }

impl Solution {
    pub fn reverse_list(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut previous: Option<Box<ListNode>> = None; // will be a head of the reversed list
        let mut current = head;

        while let Some(mut curr) = current {
            let next_temp = curr.next; // we write the next to a temp so we don't loose the rest of not reversed yet
            curr.next = previous; // we reverse the connection and point to the previous
            current = next_temp; // we advance the current 
            previous = Some(curr); // we advance the previous
        }

        return previous;
    }
}
