import Foundation

struct TaskHelper {
  let task: NSTask
    init(launchPath: String, args: [String]) {
      self.task = NSTask()
        self.task.launchPath = launchPath
        self.task.arguments = args
    }

  func performTask() -> NSString? {
    let pipe = NSPipe()
      task.standardOutput = pipe
      task.launch()

      let data = pipe.fileHandleForReading.readDataToEndOfFile()
      let output = NSString(data: data, encoding: NSUTF8StringEncoding)
      return output as? String
  }

  func getReturn() -> Int32 {
    task.launch()
      task.waitUntilExit()
      return task.terminationStatus
  }
}
