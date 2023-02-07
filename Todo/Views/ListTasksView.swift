import SwiftUI

struct ListTasksView: View {
    @ObservedObject private var viewModel:TaskListVM
    @Binding var selected:UUID?
    
    init(viewModel: TaskListVM, selected: Binding<UUID?>) {
        self.viewModel = viewModel
        self._selected = selected
    }
    var body: some View {
        List(selection: $selected){
            ForEach($viewModel.tasks) { $task in
                if shouldShowTask(task: task) {
                    HStack{
                        Toggle("\(task.title)", isOn: $task.isCompleted)
                            .strikethrough(task.isCompleted)
                        Spacer()
                        
                        Text("\(relative(task.dueDate))")
                            .padding(.horizontal, 5.0)
                            .font(.callout)
                            .background(Color(red: 0.929, green: 0.959, blue: 1.0))
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                        
                        Button {
                            viewModel.removeTask(task: task)
                        } label: {
                            Image(systemName: "trash")
                        }

                    }
                }
            }
            
        }
    }
    
    func relative(_ date: Date) -> String {
        let df = RelativeDateTimeFormatter()
        df.dateTimeStyle = .named
        return df.string(for: date)!
    }
    
    func shouldShowTask(task:Task) -> Bool {
        if self.viewModel.showAll {
            return true
        }else {
            return !task.isCompleted
        }
    }
    
}

struct ListTasksView_Previews: PreviewProvider {
    static var previews: some View {
        let tasks = [
            Task(title: "Task 1"),
            Task(title: "Task 2"),
            Task(title: "Task 3"),
            Task(title: "Task 4"),
        ]
       
        ListTasksView(viewModel: TaskListVM(tasks: tasks), selected: .constant(UUID()))
    }
}
