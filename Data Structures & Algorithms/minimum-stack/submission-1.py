class MinStack:

    def __init__(self):
        self.stack = []
        self.minPrefix = []

    def push(self, val: int) -> None:
        self.stack.append(val)
        if self.minPrefix:
           self.minPrefix.append(min(self.minPrefix[-1], val))
        else:
            self.minPrefix.append(val)

    def pop(self) -> None:
        self.stack.pop()
        self.minPrefix.pop()

    def top(self) -> int:
        return self.stack[-1]

    def getMin(self) -> int:
        return self.minPrefix[-1]
