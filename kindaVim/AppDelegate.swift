import SwiftUI


class AppDelegate: NSObject, NSApplicationDelegate {
    
    lazy var appComponent = AppComponent()

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        appComponent.setUp()
        
        NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(self.spaceDidChange), name: NSWorkspace.activeSpaceDidChangeNotification, object: nil)
    }
    
    @objc func spaceDidChange() {
        KindaVimEngine.shared.enterInsertMode()
    }

}
