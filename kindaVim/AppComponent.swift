import SwiftUI

class AppComponent {
    var statusBarController: StatusBarController!
    var vimEngine: KindaVimEngine!

    var accessibilityElementAdaptorTestingWindow: NSWindow!

    func setUp() {
        setUpStatusBar()
        #if !CITESTING
        setUpEventTap()
        #endif
        setUpVimEngine()
        
        NSApplication.shared.hide(self)
        
        #if UITESTING
        setUpUITestingWindow()
        #endif
    }

    private func setUpUITestingWindow() {
        NSApplication.shared.setActivationPolicy(.regular)
        NSApplication.shared.activate(ignoringOtherApps: true)
        
        let contentView = UITestView()

        accessibilityElementAdaptorTestingWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 680, height: 400),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        accessibilityElementAdaptorTestingWindow.center()
        accessibilityElementAdaptorTestingWindow.contentView = NSHostingView(rootView: contentView)
        accessibilityElementAdaptorTestingWindow.makeKeyAndOrderFront(nil)
    }

    private func setUpStatusBar() {
        statusBarController = StatusBarController()
    }

    private func setUpEventTap() {
        _ = EventTapController()
    }

    private func setUpVimEngine() {
        vimEngine = KindaVimEngine.shared
    }

}
