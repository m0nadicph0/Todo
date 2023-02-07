import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel:TaskListVM
    @State private var task:Task = Task()
    
    init(viewModel: TaskListVM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            
            VStack(alignment: .leading){
                Text("New Task")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Divider()
                
                HStack{
                    Text("Title")
                    TextField("", text: $task.title)
                }.padding(.top, 10)
                
                HStack{
                    Spacer()
                    Button("Cancel"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    Button("Save"){
                        self.viewModel.addTask(task: task)
                        presentationMode.wrappedValue.dismiss()
                    }.disabled(task.title.isEmpty)
                    .keyboardShortcut(.defaultAction)
                }
            }
            
        }.frame(minWidth: 300)
            .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(viewModel: TaskListVM())
    }
}
