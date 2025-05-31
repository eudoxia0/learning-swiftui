import Foundation
import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var showingGreeting: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter your name:")
                .font(.headline)

            TextField("Type your name here", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: { showingGreeting = true }) {
                Text("Greet")
            }
        }
        .alert("Greeting", isPresented: $showingGreeting) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Hello, \(name)!")
        }
        .padding(32)
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
    }
}
