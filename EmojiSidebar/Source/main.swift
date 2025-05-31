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
            "🐲"
        case .bar:
            "🌃"
        case .baz:
            "🌋"
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
            List(items, selection: $selection) { item in
                Label {
                    Text(item.name())
                } icon: {
                    Text(item.icon())
                }
            }
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
