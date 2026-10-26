class Solution {
    class Node {
        let value: Int
        var next: Node?

        init(value: Int, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    class Queue {
        private(set) var head: Node?
        private(set) var tail: Node?

        private(set) var count: Int = 0

        func enqueue(_ node: Node) {
            if count == 0 {
                head = node
                tail = node
            } else {
                tail?.next = node
                tail = node
            }

            count += 1
        }

        func dequeue() -> Node? {
            if count == 0 {
                return nil
            }
            count -= 1
            let removedNode = head
            if count == 0 {
                head = nil
                tail = nil
            } else {
                head = head?.next
            }
            removedNode?.next = nil
            return removedNode
        }
    }

    
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var queue = Queue()
        for student in students {
            queue.enqueue(Node(value: student))
        }

        var currentSandwhichIndex = 0
        var visited = Set<ObjectIdentifier>()
        while 
            currentSandwhichIndex < sandwiches.count,
            let student = queue.dequeue(),
            !visited.contains(ObjectIdentifier(student)) 
        {
            if student.value == sandwiches[currentSandwhichIndex] {
                currentSandwhichIndex += 1
                visited = []
            } else {
                queue.enqueue(student)
                visited.insert(ObjectIdentifier(student))
            }
        }

        return visited.count
    }
}


//[0, 0, 1, 1, 1]
// [0, 1, 0, 1, 0, 1]
//     ^

// [1, 1, 1, 0, 0]
// [0, 1, 0, 1, 0, 1]
//     ^


// [1, 1, 1, 0, 0]
// [0, 1, 0, 1, 0, 1]
//     ^

// [1 1 0 0]
// [0, 1, 0, 1, 0, 1]
//        ^

// [0 0 1 1]
// [0, 1, 0, 1, 0, 1]
//        ^

// [0 1 1]
// [0, 1, 0, 1, 0, 1]
//           ^

