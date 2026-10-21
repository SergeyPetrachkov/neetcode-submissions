class MyLinkedList {

    class ListNode {
        var value: Int
        var next: ListNode?
        weak var previous: ListNode?

        init(value: Int, next: ListNode? = nil, previous: ListNode? = nil) {
            self.value = value
            self.next = next
            self.previous = previous
        }
    }

    var head: ListNode?
    var tail: ListNode?

    var count: Int = 0

    init() {
        
    }
    
    func get(_ index: Int) -> Int {
        let node = getNode(index)
        return node?.value ?? -1
    }

    private func getNode(_ index: Int) -> ListNode? {
        if index >= count || index < 0 {
            return nil
        }

        let middle = count / 2
        let step = index < middle ? 1 : -1

        var currentNode: ListNode? = step == 1 ? head : tail
        let numberOfHops = step == 1 ? index : count - 1 - index

        // 0 <> 1 <> 2 <> 3 <> 4 <> 5
        for _ in 0..<numberOfHops {
            currentNode = step == 1 ? currentNode?.next : currentNode?.previous
        }

        return currentNode
    }
    
    func addAtHead(_ val: Int) {
        let node = ListNode(value: val)
        if let head {
            node.next = head
            head.previous = node
            self.head = node
        } else {
            self.head = node
            self.tail = node
        }
        count += 1
    }
    
    func addAtTail(_ val: Int) {
        let node = ListNode(value: val)
        if let tail {
            tail.next = node
            node.previous = tail
            self.tail = node
        } else {
            self.head = node
            self.tail = node
        }
        count += 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index <= 0 {
            return addAtHead(val)
        }
        if index == count {
            return addAtTail(val)
        }
        guard let rightSideNode = getNode(index) else {
            return
        }
        let leftSideNode = rightSideNode.previous

        let newNode = ListNode(value: val)

        // establish bi-direct connection between the new and right side
        newNode.next = rightSideNode
        rightSideNode.previous = newNode
        
        // establish bi-direct connection between the new and left side
        leftSideNode?.next = newNode
        newNode.previous = leftSideNode
        
        count += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        if index < 0 || index > count - 1 {
            return
        }
        defer { count -= 1 }
        if index == 0 {
            // head
            guard let nextHead = head?.next else {
                self.tail = nil
                self.head = nil
                return
            }
            nextHead.previous = nil
            self.head = nextHead
            return
        }

        if index == count - 1 {
            // tail
            guard let newTail = tail?.previous else {
                self.head = nil
                self.tail = nil
                return
            }
            newTail.next = nil
            self.tail = newTail
            return
        }
        // in-the-middle
        guard let nodeToDelete = getNode(index) else {
            return
        }
        // A <> B <> C
        // A <> C
        let rightSideNode = nodeToDelete.next
        let leftSideNode = nodeToDelete.previous

        leftSideNode?.next = rightSideNode
        rightSideNode?.previous = leftSideNode

        nodeToDelete.previous = nil
        nodeToDelete.next = nil
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */