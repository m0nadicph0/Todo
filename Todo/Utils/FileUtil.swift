import Foundation

class FileUtil {
    class func loadTasks(_ fileName: String) -> [Task] {
        let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
        var loadedTasks: [Task] = []
        do {
            let data = try Data(contentsOf: fileURL)
            let tasks = try JSONDecoder().decode([Task].self, from: data)
            tasks.forEach { task in
                loadedTasks.append(task)
            }
        } catch {
            print("Failed to load task list: \(error)")
        }

        return loadedTasks
    }
    
    class func saveTasks(_ fileName: String, tasks: [Task]) {
        let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save task list: \(error)")
        }
    }
}
