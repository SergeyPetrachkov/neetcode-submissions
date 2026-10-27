class MyStack {

    struct Queue {
        var array: [Int] = []
        mutating func enqueue(_ value: Int) {
            array.append(value)
        }
        mutating func dequeue() -> Int? {
            array.removeFirst()
        }
        func peek() -> Int? {
            array.first
        }
        var count: Int {
            array.count
        }
        var isEmpty: Bool {
            array.isEmpty
        }
    }

    var queue = Queue()

    init() {

    }

    func push(_ x: Int) {
        let count = queue.count
        queue.enqueue(x)
        for _ in 0..<count {
            if let rotatingElement = queue.dequeue() {
                queue.enqueue(rotatingElement)
            }
        }
    }

    func pop() -> Int {
        queue.dequeue()!
    }

    func top() -> Int {
        queue.peek()!
    }

    func empty() -> Bool {
        queue.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let param_2 = obj.pop()
 * let param_3 = obj.top()
 * let param_4 = obj.empty()
 */
