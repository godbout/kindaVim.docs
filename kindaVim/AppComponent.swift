import Foundation

class AppComponent {
    var statusBarController: StatusBarController!
    var vimEngine: VimEngine!

    func setUp() {
        setUpStatusBar()
        setUpVimEngine()
    }

    private func setUpStatusBar() {
        statusBarController = StatusBarController()
    }

    private func setUpVimEngine() {
        vimEngine = VimEngine.shared
    }
}
