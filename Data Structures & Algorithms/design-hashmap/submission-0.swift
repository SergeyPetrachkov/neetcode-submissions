class MyHashMap {

    private struct Pair {
        let key: Int
        let value: Int

        var hashValue: Int {
            key
        }
    }

    private enum Slot {
        case empty
        case deleted
        case occupied(Pair)
    }

    /// Allocated capacity at the moment
    private(set) var capacity: Int

    /// How many key-value pairs we have in the HashMap
    var count: Int {
        occupiedCount
    }

    private var occupiedCount: Int
    private var deletedCount: Int
    private var emptyCount: Int

    private var storage: [Slot] = []

    init() {
        // we take a prime number to reduce a number of collisions with the mod
        self.capacity = 7
        self.emptyCount = 7
        self.occupiedCount = 0
        self.deletedCount = 0
        storage = Array(repeating: .empty, count: capacity)
    }

    func put(_ key: Int, _ value: Int) {
        let homeIndex = homeIndex(for: key)
        var index = homeIndex
        var lastDeletedIndex: Int?
        var probes = 0
        while probes < capacity {
            switch storage[index] {
            case .empty:
                if let lastDeletedIndex { // we hit the empty spot, but it's not the first empty, but rather a next empty as a terminator of our search
                    storage[lastDeletedIndex] = .occupied(Pair(key: key, value: value))
                    deletedCount -= 1
                } else {
                    storage[index] = .occupied(Pair(key: key, value: value))
                    emptyCount -= 1
                }
                occupiedCount += 1
                if occupiedCount > (capacity / 2) {
                    rehash()
                }
                return
            case .deleted: // move on, but remember the first deleted index
                if lastDeletedIndex == nil {
                    lastDeletedIndex = index
                }
            case .occupied(let pair):
                if pair.key == key { // update the existing key
                    storage[index] = .occupied(Pair(key: key, value: value))
                    return
                }
            }
            index += 1 
            if index == capacity {
                index = 0
            }   
            probes += 1
        }

        if let lastDeletedIndex {
            storage[lastDeletedIndex] = .occupied(Pair(key: key, value: value))
            deletedCount -= 1
            occupiedCount += 1
        }

        if occupiedCount > (capacity / 2) {
            rehash()
        }
    }

    func get(_ key: Int) -> Int {
        var index = homeIndex(for: key)
        var probes = 0

        while probes < capacity {
            switch storage[index] {
            case .occupied(let pair):
                if pair.key == key {
                    return pair.value
                }
            case .deleted:
                break
            case .empty:
                return -1
            }
            index += 1
            if index == capacity {
                index = 0
            }
            probes += 1
        }
        return -1
    }

    func remove(_ key: Int) {
        var index = homeIndex(for: key)
        var probes = 0

        while probes < capacity {
            switch storage[index] {
            case .occupied(let pair):
                if pair.key == key {
                    storage[index] = .deleted
                    occupiedCount -= 1
                    deletedCount += 1
                    return
                }
            case .deleted:
                break
            case .empty:
                return
            }
            index += 1
            if index == capacity {
                index = 0
            }
            probes += 1
        }
    }

    private func rehash() {
        let oldStorage = storage
        capacity *= 2
        emptyCount = capacity
        occupiedCount = 0
        deletedCount = 0
        storage = Array(repeating: .empty, count: capacity)
        for slot in oldStorage {
            switch slot {
            case .occupied(let pair):
                put(pair.key, pair.value)
            default:
                break
            }
        }
    }

    private func homeIndex(for hashValue: Int) -> Int {
        hashValue % capacity
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
