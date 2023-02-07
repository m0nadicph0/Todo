import SwiftUI

struct HeaderView: View {
    @State var isPresented = false
    
    @ObservedObject private var viewModel:TaskListVM
  
    init(isPresented: Bool = false, viewModel: TaskListVM) {
        self.isPresented = isPresented
        self.viewModel = viewModel
    }
      
    var body: some View {
        HStack{
            Text("My Tasks").fontWeight(.bold)
            Spacer()
            Toggle("All", isOn: $viewModel.showAll).toggleStyle(.switch)
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "plus.square.fill")
            }
            .controlSize(.large)
            .keyboardShortcut("i")
            .sheet(isPresented: $isPresented) {
                AddTaskView(viewModel: viewModel)
            }
            
        }.padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewModel: TaskListVM())
    }
}
