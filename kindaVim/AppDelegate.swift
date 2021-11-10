import SwiftUI


class AppDelegate: NSObject, NSApplicationDelegate {
    
    lazy var splashScreenWindow: NSWindow = {
        let window = NSWindow(
            contentRect: NSRect(),
            styleMask: [.titled],
            backing: .buffered,
            defer: true
        )
        
        window.styleMask.remove(.titled)
        window.backgroundColor = .clear
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
        
        AppCore.shared.setUp()
    }
        
    private func showSplashScreen() {
        let splashScreenView = SplashScreenView()
        
        splashScreenWindow.contentView = NSHostingView(rootView: splashScreenView)
        splashScreenWindow.orderFrontRegardless()
    }
    
    @objc func accessibilityPrivilegesDidChange() {
        guard AXIsProcessTrusted() else {
            disableEventTap()
            showSplashScreen()
            
            return
        }
        
        splashScreenWindow.orderOut(self)
        AppCore.shared.setUpAgainIfNecessary()
    }
    
    private func disableEventTap() {
        guard let eventTap = EventTapController.eventTap else {
            return
        }
        
        CGEvent.tapEnable(tap: eventTap, enable: false)
    }
    
    @objc func spaceDidChange() {
        guard AppCore.shared.vimEngine != nil else { return }
        
        AppCore.shared.vimEngine.enterInsertMode()
    }

}
