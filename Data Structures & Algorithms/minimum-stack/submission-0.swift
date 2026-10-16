class MinStack {

    var stack: [Int] = []
    var minPrefix: [Int] = []

    init() {

    }

    func push(_ val: Int) {
        stack.append(val)
        if minPrefix.isEmpty {
            minPrefix.append(val)
        } else {
            minPrefix.append(min(val, minPrefix.last!))
        }
    }

    func pop() {
        stack.removeLast()
        minPrefix.removeLast()
    }

    func top() -> Int {
        stack.last!
    }

    func getMin() -> Int {
        minPrefix.last!
    }
}
