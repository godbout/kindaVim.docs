import SwiftUI


class AppDelegate: NSObject, NSApplicationDelegate {
    
    lazy var appComponent = AppComponent()
    lazy var splashScreenWindow: NSWindow = {
        let window = NSWindow(
            contentRect: NSRect(),
            styleMask: [.titled, .nonactivatingPanel],
            backing: .buffered,
            defer: true
        )
        
        window.title = "kindaVim Accessibility Privileges"
        window.isMovableByWindowBackground = true
        window.isRestorable = false
        window.center()
        
        return window
    }()

    
    func applicationDidFinishLaunching(_ notification: Notification) {
        DistributedNotificationCenter.default().addObserver(self, selector: #selector(self.accessibilityPrivilegesDidChange), name: NSNotification.Name("com.apple.accessibility.api"), object: nil)
        NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(self.spaceDidChange), name: NSWorkspace.activeSpaceDidChangeNotification, object: nil)
        
        guard AXIsProcessTrusted() else {
            showSplashScreen()
            
            return
        }
        
        appComponent.setUp()
    }
        
    private func showSplashScreen() {
        let splashScreenView = SplashScreenView()
        
        splashScreenWindow.contentView = NSHostingView(rootView: splashScreenView)
        splashScreenWindow.makeKeyAndOrderFront(self)
    }
    
    @objc func accessibilityPrivilegesDidChange() {
        guard AXIsProcessTrusted() else {
            disableEventTap()
            showSplashScreen()
            
            return
        }
        
        splashScreenWindow.orderOut(self)
        appComponent.setUpAgainIfNecessary()
        NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
    }
    
    private func disableEventTap() {
        guard let eventTap = EventTapController.eventTap else {
            return
        }
        
        CGEvent.tapEnable(tap: eventTap, enable: false)
    }
    
    @objc func spaceDidChange() {
        KindaVimEngine.shared.enterInsertMode()
    }

}
