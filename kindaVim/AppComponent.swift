import SwiftUI

class AppComponent {
    var statusBarController: StatusBarController!
    var vimEngine: VimEngine!

    var accessibilityElementAdaptorTestingWindow: NSWindow!

    func setUp() {
        setUpWindowsState()
        setUpStatusBar()
        #if !TESTING
        setUpEventTap()
        #endif
        setUpVimEngine()
    }

    private func setUpWindowsState() {
        NSApplication.shared.hide(self)

        #if TESTING
        let contentView = ContentView()

        accessibilityElementAdaptorTestingWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        accessibilityElementAdaptorTestingWindow.center()
        accessibilityElementAdaptorTestingWindow.contentView = NSHostingView(rootView: contentView)
        accessibilityElementAdaptorTestingWindow.makeKeyAndOrderFront(nil)
        #endif
    }

    private func setUpStatusBar() {
        statusBarController = StatusBarController()
    }

    private func setUpEventTap() {
        _ = EventTapController()
    }

    private func setUpVimEngine() {
        vimEngine = VimEngine.shared
    }

}
