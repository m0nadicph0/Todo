import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title:String = ""
    var dueDate: Date = Date()
    var isCompleted: Bool = false
    var category: String  = "none"
    
    init(title: String, dueDate: Date, isCompleted: Bool, category: String) {
        self.title = title
        self.dueDate = dueDate
        self.isCompleted = isCompleted
        self.category = category
    }
    
    init() {
        self.title = ""
        self.dueDate = Date()
        self.isCompleted = false
        self.category = "none"
    }
    
    init(title: String) {
        self.title = title
        self.dueDate = Date()
        self.isCompleted = false
        self.category = "none"
    }
}
