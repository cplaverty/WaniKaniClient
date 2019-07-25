import Foundation
import os.log

final class ResourceRequestTask<Resource> {
    public let progress: Progress
    public var resources = [Resource]()
    
    private var tasks = [URLSessionTask]()
    
    init(totalUnitCount: Int64 = -1) {
        progress = Progress(totalUnitCount: totalUnitCount)
        progress.isCancellable = true
        progress.isPausable = true
        
        progress.cancellationHandler = cancelTasks
        progress.pausingHandler = suspendTasks
        progress.resumingHandler = resumeTasks
    }
    
    deinit {
        os_log("Marking progress complete for request (was %jd of %jd)", type: .debug, progress.completedUnitCount, progress.totalUnitCount)
        progress.totalUnitCount = min(progress.totalUnitCount, 1)
        progress.completedUnitCount = min(progress.totalUnitCount, 1)
    }
    
    var isCancelled: Bool {
        return progress.isCancelled
    }
    
    var isPaused: Bool {
        return progress.isPaused
    }
    
    func addAndResume(_ task: URLSessionTask) {
        tasks.append(task)
        
        if !isCancelled && !isPaused {
            task.resume()
        }
    }
    
    func cancel() {
        progress.cancel()
    }
    
    private func cancelTasks() {
        tasks.forEach { task in
            task.cancel()
        }
    }
    
    private func suspendTasks() {
        tasks.forEach { task in
            task.suspend()
        }
    }
    
    private func resumeTasks() {
        tasks.forEach { task in
            task.resume()
        }
    }
}
