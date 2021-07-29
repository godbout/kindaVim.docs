import AppKit

struct HazeOverWindow {
    
    var window: NSWindow
    
    init() {
        window = NSWindow(
            contentRect: NSRect(),
            styleMask: [],
            backing: .buffered,
            defer: true
        )
        
        window.backgroundColor = .black
        window.alphaValue = 0.8
        window.animationBehavior = .utilityWindow
    }
    
    
    func on() {
        guard let screen = NSScreen.main else { return }
        window.setFrameOrigin(screen.visibleFrame.origin)
        window.setFrame(NSRect(x: 0, y: 0, width: screen.frame.width, height: screen.frame.height), display: true)
        
        let mainWindowNumber = macOSMainWindowNumber() ?? -6969
        window.order(.below, relativeTo: mainWindowNumber)
    }
    
    private func macOSMainWindowNumber() -> Int? {
        guard let pid = NSWorkspace.shared.frontmostApplication?.processIdentifier else { return nil }
        guard let tooManyWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as NSArray? else { return nil }
        guard let mainWindowData = tooManyWindows.filtered(using: NSPredicate(format: "kCGWindowOwnerPID = \(pid)")).first as? NSDictionary else { return nil } 
        
        return mainWindowData.value(forKey: "kCGWindowNumber") as? Int
    }
    
    func off() {
        window.orderOut(self)
    }
    
}
