class LRUCache {

    private class Node {
        let key: Int
        var val: Int
        var next: Node?
        weak var prev: Node?

        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }

    private class DLL {
        private var dummyHead = Node(-1, 0) // LRU
        private var dummyTail = Node(-1, 0) // MRU

        init() {
            dummyHead.next = dummyTail
            dummyTail.prev = dummyHead
        }

        var isEmpty: Bool {
            dummyHead.next === dummyTail && dummyTail.prev === dummyHead
        }

        func insert(_ node: Node) {
            let leftSide = dummyTail.prev

            // connect to the sentinel
            dummyTail.prev = node
            node.next = dummyTail

            // connect to the left side
            leftSide?.next = node
            node.prev = leftSide
        }

        func remove(_ node: Node) {
            let leftSide = node.prev
            let rightSide = node.next

            leftSide?.next = rightSide
            rightSide?.prev = leftSide
        }

        func evictHead() -> Node? {
            guard !isEmpty, let realHead = dummyHead.next else {
                return nil
            }
            remove(realHead)
            return realHead
        }
    }

    private let capacity: Int
    private let list: DLL
    private var dict: [Int: Node]

    init(_ capacity: Int) {
        self.capacity = capacity
        self.list = DLL()
        self.dict = [:]
    }

    func get(_ key: Int) -> Int {
        guard let node = dict[key] else {
            return -1
        }
        list.remove(node)
        list.insert(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let existingNode = dict[key] {
            list.remove(existingNode)
            existingNode.val = value
            list.insert(existingNode)
        } else {
            let newNode = Node(key, value)
            list.insert(newNode)
            dict[key] = newNode
            if dict.count > capacity {
                if let evictedNode = list.evictHead() {
                    dict[evictedNode.key] = nil
                }
            }
        }
    }
}
