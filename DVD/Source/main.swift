import Foundation
import SwiftUI

let period: Double = 0.016

struct ContentView: View {
    @State private var position = CGPoint(x: 250, y: 50)
    @State private var velocity = CGPoint(x: 2, y: 2)
    @State private var timer: Timer?

    let size = CGSize(width: 500, height: 500)

    var body: some View {
        ZStack {
            Button(action: {}) {
                Text("💿")
                    .font(.system(size: 32))
            }
            .position(position)
        }
        .frame(width: size.width, height: size.height)
        .fixedSize()
        .onAppear {
            startBouncing()
        }
        .onDisappear {
            stopBouncing()
        }
    }

    private func startBouncing() {
        timer = Timer.scheduledTimer(withTimeInterval: period, repeats: true) { _ in
            updatePosition()
        }
    }

    private func stopBouncing() {
        timer?.invalidate()
        timer = nil
    }

    private func updatePosition() {
        var xp = position.x + velocity.x
        var yp = position.y + velocity.y
        var vxp = velocity.x
        var vyp = velocity.y

        // Collision with right wall.
        if xp > size.width {
            xp = size.width
            vxp = -vxp
        }

        // Collision with left wall.
        if xp < 0 {
            xp = 0
            vxp = -vxp
        }

        // Collision with bottom wall.
        if yp > size.height {
            yp = size.height
            vyp = -vyp
        }

        // Collision with top wall.
        if yp < 0 {
            yp = 0
            vyp = -vyp
        }

        withAnimation(.linear(duration: period)) {
            position = CGPoint(x: xp, y: yp)
            velocity = CGPoint(x: vxp, y: vyp)
        }
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
        .windowResizability(.contentSize)
    }
}
