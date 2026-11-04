// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//     pub val: i32,
//     pub left: Option<Rc<RefCell<TreeNode>>>,
//     pub right: Option<Rc<RefCell<TreeNode>>>,
// }
//
// impl TreeNode {
//     #[inline]
//     pub fn new(val: i32) -> Self {
//         TreeNode {
//             val,
//             left: None,
//             right: None,
//         }
//     }
// }

use std::rc::Rc;
use std::cell::RefCell;

impl Solution {
    pub fn inorder_traversal(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        if let Some(r) = root {
            let mut result: Vec<i32> = Vec::new();
            let node = r.borrow();

            result.extend(Self::inorder_traversal(node.left.clone()));
            result.push(node.val);
            result.extend(Self::inorder_traversal(node.right.clone()));
            
            result
        } else {
            return Vec::new();
        }
    }
}
