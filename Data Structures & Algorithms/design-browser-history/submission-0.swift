class BrowserHistory {

    private var pages: [String]
    private var cursor: Int

    init(_ homepage: String) {
        self.pages = [homepage]
        self.cursor = 0
    }
    
    func visit(_ url: String) {
        if cursor == pages.count - 1 {
            pages.append(url)
        } else {
            pages.removeLast(pages.count - 1 - cursor)
            pages.append(url)
        }
        cursor += 1
    }
    
    func back(_ steps: Int) -> String {
        cursor = max(0, cursor - steps)
        return pages[cursor]
    }
    
    func forward(_ steps: Int) -> String {
        cursor = min(pages.count - 1, cursor + steps)
        return pages[cursor]        
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */