import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .font(.system(size: 32))
            .padding(64)
            // Do not allow shrinking the window below the minimum content size.
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
        // Window starts at content size, can be resized up.
        .windowResizability(.contentMinSize)
    }
}
