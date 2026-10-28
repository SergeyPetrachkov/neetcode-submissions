class Deque {

    private class Node {
        let value: Int
        var next: Node?
        weak var previous: Node?

        init(value: Int) {
            self.value = value
        }
    }

    private var dummyFront: Node
    private var dummyBack: Node

    init() {
        dummyFront = Node(value: -1)
        dummyBack = Node(value: -1)
        dummyFront.next = dummyBack
        dummyBack.previous = dummyFront
    }

    func isEmpty() -> Bool {
        dummyFront.next === dummyBack && dummyBack.previous === dummyFront
    }

    func append(_ value: Int) {
        let node = Node(value: value)
        // preserve the real back pointer
        let currentRealBack = dummyBack.previous
        // attach our new node to the real back
        node.previous = currentRealBack
        currentRealBack?.next = node
        // attach our new node to the dummy back
        dummyBack.previous = node
        node.next = dummyBack
    }

    func appendleft(_ value: Int) {
        let node = Node(value: value)

        // preserve the real front
        let realFront = dummyFront.next
        // attach dummy front to our node
        node.previous = dummyFront
        dummyFront.next = node
        // attach our node from the right side
        node.next = realFront
        realFront?.previous = node
    }

    func pop() -> Int {
        if isEmpty() {
            return -1
        }
        let nodeToRemove = dummyBack.previous

        let newRealFrontToBe = nodeToRemove?.previous

        dummyBack.previous = newRealFrontToBe
        newRealFrontToBe?.next = dummyBack

        let value = nodeToRemove?.value
        return value ?? -1
    }

    func popleft() -> Int {
        if isEmpty() {
            return -1
        }

        let nodeToRemove = dummyFront.next

        let newRealFrontToBe = nodeToRemove?.next

        dummyFront.next = newRealFrontToBe
        newRealFrontToBe?.previous = dummyFront

        let value = nodeToRemove?.value
        return value ?? -1
    }
}
