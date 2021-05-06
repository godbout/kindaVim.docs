import Foundation

class AppComponent {
    var statusBarController: StatusBarController!
    var vimEngineController: VimEngineController!

    func setUp() {
        setUpStatusBar()
        setUpVimEngine()
    }

    private func setUpStatusBar() {
        statusBarController = StatusBarController()
    }

    private func setUpVimEngine() {
        vimEngineController = VimEngineController.shared
    }
}
