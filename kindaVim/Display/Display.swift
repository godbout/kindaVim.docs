import Foundation
import AppKit


struct Display {

    var hazeOverWindow: NSWindow?
    
    
    init() {
        hazeOverWindow = NSWindow(
            contentRect: NSRect(),
            styleMask: [],
            backing: .buffered,
            defer: true
        )
        
        hazeOverWindow?.backgroundColor = .black
        hazeOverWindow?.alphaValue = 0.8
        hazeOverWindow?.animationBehavior = .utilityWindow
    }
    
    func hazeOver() {
        guard let screen = NSScreen.main else { return }
        hazeOverWindow?.setFrameOrigin(screen.visibleFrame.origin)
        hazeOverWindow?.setFrame(NSRect(x: 0, y: 0, width: screen.frame.width, height: screen.frame.height), display: true)
        
        let mainWindowNumber = macOSMainWindowNumber() ?? -6969
        hazeOverWindow?.order(.below, relativeTo: mainWindowNumber)
    }
    
    private func macOSMainWindowNumber() -> Int? {
        guard let pid = NSWorkspace.shared.frontmostApplication?.processIdentifier else { return nil }
        guard let tooManyWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as NSArray? else { return nil }
        guard let mainWindowData = tooManyWindows.filtered(using: NSPredicate(format: "kCGWindowOwnerPID = \(pid)")).first as? NSDictionary else { return nil } 
        
        return mainWindowData.value(forKey: "kCGWindowNumber") as? Int
    }
    
    func unHazeOver() {
        hazeOverWindow?.orderOut(self)
    }
    
}
