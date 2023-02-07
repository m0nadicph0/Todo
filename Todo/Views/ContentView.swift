import SwiftUI

struct ContentView: View {
    @State var selected:UUID?
    @ObservedObject var viewModel:TaskListVM
    
    var body: some View {
        VStack {
            HeaderView(viewModel: viewModel)
            Divider()
            
            ListTasksView(viewModel: viewModel, selected: $selected)
        }
        .padding()
        .frame(width: 400, height: 600)
        .background {
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
        }
    }
    
    func shouldShowTask(task:Task) -> Bool {
        if self.viewModel.showAll {
            return true
        }else {
            return !task.isCompleted
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let tasks = [
            Task(title: "Task 1"),
            Task(title: "Task 2"),
            Task(title: "Task 3"),
            Task(title: "Task 4"),
        ]
        ContentView(viewModel: TaskListVM(tasks: tasks))
    }
}
