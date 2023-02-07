import SwiftUI

var viewModel = TaskListVM()

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        viewModel.addTasks(tasks: FileUtil.loadTasks("todo.json"))
    }
    
    
    
    func applicationWillTerminate(_ notification: Notification) {
        FileUtil.saveTasks("todo.json", tasks: viewModel.tasks)
    }
    
    
}

@main
struct TodoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .onAppear{
                    NSWindow.allowsAutomaticWindowTabbing = false
                }
        }
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar).commands {
            CommandGroup(replacing: CommandGroupPlacement.newItem) {}
        }
    }
}
