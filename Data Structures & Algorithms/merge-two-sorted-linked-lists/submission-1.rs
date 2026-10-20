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
    pub fn merge_two_lists(list1: Option<Box<ListNode>>, list2: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut dummy = ListNode::new(0);
        let mut tail = &mut dummy;

        let mut l1 = list1;
        let mut l2 = list2;

        while l1.is_some() && l2.is_some() {
            let left = l1.as_ref().unwrap();
            let right = l2.as_ref().unwrap();

            if left.val < right.val {
                let mut node = l1.take().unwrap();
                l1 = node.next.take();
                tail.next = Some(node);
            } else {
                let mut node = l2.take().unwrap();
                l2 = node.next.take();
                tail.next = Some(node);
            }
            tail = tail.next.as_mut().unwrap();
        }

        tail.next = l1.or(l2);
        dummy.next
    }
}
