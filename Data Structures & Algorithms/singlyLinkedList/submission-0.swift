class LinkedList {

    class Node {
        let value: Int
        var next: Node?

        init(value: Int, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    private var head: Node?
    private var tail: Node?

    private(set) var count: Int = 0

    func get(_ index: Int) -> Int {
        let targetNode = getNodes(index: index).target
        return targetNode?.value ?? -1
    }

    private func getNodes(index: Int) -> (left: Node?, target: Node?) {
        if index < 0 || index > count - 1 || head == nil {
            return (left: nil, target: nil)
        }

        if index == 0 {
            return (left: nil, target: head)
        }

        var cursor = head
        var currentIndex = 0
        // we go to the one before the target index
        while currentIndex < index - 1 {
            cursor = cursor?.next
            currentIndex += 1
        }
        return (left: cursor, target: cursor?.next)
    }

    func insertHead(_ value: Int) {
        let newNode = Node(value: value)
        if count == 0 {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }

        count += 1
    }

    func insertTail(_ value: Int) {
        let newNode = Node(value: value)
        if count == 0 {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }

        count += 1
    }

    func remove(_ index: Int) -> Bool {
        if index < 0 || index > count - 1 {
            return false
        }

        defer { 
            count -= 1 
            if count == 0 {
                head = nil
                tail = nil
            }
        }
        // remove the tail
        if index == count - 1 {
            let nodes = getNodes(index: index)
            tail = nodes.left
            tail?.next = nil
            return true
        }

        // remove the head
        if index == 0 {
            head = head?.next
            return true
        }
         
        // remove from the middle
        let nodes = getNodes(index: index)
        let left = nodes.left
        let nodeToRemove = nodes.target
        let right = nodeToRemove?.next
        left?.next = right

        return true
    }

    func getValues() -> [Int] {  
        guard let head else {
            return []
        }

        var result: [Int] = [head.value]
        result.reserveCapacity(count)

        var cursor = head.next

        while cursor != nil {
            result.append(cursor!.value)
            cursor = cursor?.next
        }
        return result
    }
}
