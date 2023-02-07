import Foundation

class TaskListVM: ObservableObject {
    @Published var tasks:[Task] = []
    @Published var showAll:Bool = false
    
    init() {
        self.tasks = []
        self.showAll = false
    }
    
    init(tasks:[Task]) {
        self.tasks = tasks
    }
    
    
    func addTask(task:Task) {
        self.tasks.append(task)
    }
    
    func removeTask(task:Task) {
        let index = self.tasks.firstIndex{ $0.id == task.id}
        self.tasks.remove(at: index!)
    }
}
