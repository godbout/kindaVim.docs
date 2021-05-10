import Foundation

class AppComponent {
    var statusBarController: StatusBarController!
    var vimEngine: VimEngine!

    func setUp() {
        setUpStatusBar()
        #if !TESTING
            setUpEventTap()
        #endif
        setUpVimEngine()
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
