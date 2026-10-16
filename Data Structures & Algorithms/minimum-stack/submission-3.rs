struct MinStack {
    stack: Vec<i32>,
    min_prefix: Vec<i32>,
}

impl MinStack {
    pub fn new() -> Self {
        Self {
            stack: Vec::new(),
            min_prefix: Vec::new(),
        }
    }

    pub fn push(&mut self, val: i32) {
        self.stack.push(val);
        let min = if let Some(&top) = self.min_prefix.last() {
            val.min(top)
        } else {
            val
        };
        self.min_prefix.push(min);
    }

    pub fn pop(&mut self) {
        self.stack.pop();
        self.min_prefix.pop();
    }

    pub fn top(&self) -> i32 {
        return *self.stack.last().unwrap();
    }

    pub fn get_min(&self) -> i32 {
        return *self.min_prefix.last().unwrap();
    }
}
