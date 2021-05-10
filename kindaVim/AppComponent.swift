import Cocoa
import Foundation

class AppComponent {
    var statusBarController: StatusBarController!
    var vimEngine: VimEngine!

    func setUp() {
        setUpWindowState()
        setUpStatusBar()
        #if !TESTING
            setUpEventTap()
        #endif
        setUpVimEngine()
    }

    private func setUpWindowState() {
        NSApplication.shared.hide(self)
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
