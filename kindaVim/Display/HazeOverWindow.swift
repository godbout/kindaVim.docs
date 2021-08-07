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
        window.animationBehavior = .utilityWindow
        window.collectionBehavior = [.canJoinAllSpaces, .transient]
    }
    
    
    func on() {
        // we need to test first if the mainWindow is fullScreen because it seems the window system
        // in macOS is quite buggy. the doc says that the CGWindowListCopyWindowInfo returns windows from
        // front to back but it doesn't work properly when in fullScreen. furthermore the NSScreen.main returns
        // the wrong screen in fullScreen mode too (returns the default one rather than the main).
        if mainWindowIsInFullScreenMode() {
            guard let screen = NSScreen.main else { return }
            
            window.setFrame(NSRect(origin: screen.frame.origin, size: screen.frame.size), display: true)
            window.alphaValue = 0.1
            window.order(.above, relativeTo: mainWindowNumber() ?? -6969)
        } else {
            guard let screen = NSScreen.main else { return }
            
            window.setFrame(NSRect(origin: screen.visibleFrame.origin, size: screen.visibleFrame.size), display: true)
            window.alphaValue = 0.8 
            window.order(.below, relativeTo: mainWindowNumber() ?? -6969)
        }
    }
    
    private func mainWindowIsInFullScreenMode() -> Bool {
        return AXEngine.axFullScreenStatus(of: AXEngine.axFocusedElement())
    }
    
    private func mainWindowNumber() -> Int? {
        guard let pid = NSWorkspace.shared.frontmostApplication?.processIdentifier else { return nil }
        guard let tooManyWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as NSArray? else { return nil }
        guard let mainWindowData = tooManyWindows.filtered(using: NSPredicate(format: "kCGWindowOwnerPID = \(pid)")).first as? NSDictionary else { return nil } 
        
        return mainWindowData.value(forKey: "kCGWindowNumber") as? Int
    }
    
    func off() {
        window.orderOut(self)
    }
    
}
