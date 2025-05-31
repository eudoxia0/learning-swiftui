import Foundation
import SwiftUI

enum Selection: Identifiable {
    case foo
    case bar
    case baz

    var id: Selection {
        self
    }

    func name() -> String {
        switch self {
        case .foo:
            "Foo"
        case .bar:
            "Bar"
        case .baz:
            "Baz"
        }
    }

    func icon() -> String {
        switch self {
        case .foo:
            "star.fill"
        case .bar:
            "moon.stars.fill"
        case .baz:
            "sun.max.fill"
        }
    }
}

struct ContentView: View {
    @State var selection: Selection = Selection.foo

    private var items = [
        Selection.foo,
        Selection.bar,
        Selection.baz,
    ]

    var body: some View {
        NavigationSplitView {
            List(items, selection: $selection) {
                Label($0.name(), systemImage: $0.icon())
            }
            // Uncomment to remove the sidebar toggle:
            // .toolbar(removing: .sidebarToggle)
        } detail: {
            DetailView(selection: selection)
        }
    }
}

struct DetailView: View {
    let selection: Selection

    var body: some View {
        let name = selection.name()
        Text("\(name)!")
            .navigationTitle(name)
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
