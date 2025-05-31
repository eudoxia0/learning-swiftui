import Foundation
import SwiftUI

let correctUsername: String = "admin"
let correctPassword: String = "hunter2"

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var success: Bool = false

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Username")

                TextField("", text: $username)
                    .frame(width: 250)

                Text("Password")

                SecureField("", text: $password)
                    .frame(width: 250)
            }
            .padding(.bottom, 16)

            HStack {
                Button("Reset") {
                    resetForm()
                }

                Spacer()

                Button("Login") {
                    attemptLogin()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .alert(
            success ? "Success" : "Access Denied",
            isPresented: $showAlert
        ) {
            Button("Dismiss", role: .none) {}
        } message: {
            Text(success ? "Welcome back!" : "Access Denied")
        }
        .padding(.horizontal, 64)
        .padding(.vertical, 32)
        .fixedSize()
    }

    private func resetForm() {
        username = ""
        password = ""
    }

    private func attemptLogin() {
        let tmp = username == correctUsername && password == correctPassword
        success = tmp
        showAlert = true
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
