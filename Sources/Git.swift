import Foundation

struct Git {
    let path: String
    
    init?(path: String) {
        guard TaskHelper(launchPath: path, args: ["status"]).getReturn() == 0 else {
            return nil
        }
        self.path = path
    }
    
    var lastTag: String? {
        let task = TaskHelper(launchPath: path, args: ["describe", "--tags"])
        return task.performTask()
    }
}


