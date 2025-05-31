import Foundation
import SwiftUI

struct ContentView: View {
    @State var count: Int = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
                .font(.system(size: 32))

            Button(action: { count += 1 }) {
                Text("Increment")
            }
        }
        .padding(64)
        .fixedSize()
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

@main
struct HelloWorldApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentMinSize)
    }
}
