import Foundation
import AppKit


struct Display {

    var window: NSWindow?
    
    
    init() {
        if let screen = NSScreen.main {
            window = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: screen.frame.width, height: screen.frame.height),
                styleMask: [],
                backing: .buffered,
                defer: true,
                screen: screen
            )
            
            window?.backgroundColor = .black
            window?.alphaValue = 0.8
            window?.animationBehavior = .utilityWindow
        }
    }
    
    func tint() {
        let mainWindowNumber = self.mainWindowNumber() ?? -6969
        
        window?.order(.below, relativeTo: mainWindowNumber)
    }
    
    private func mainWindowNumber() -> Int? {
        guard let pid = NSWorkspace.shared.frontmostApplication?.processIdentifier else { return nil }
        guard let tooManyWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as NSArray? else { return nil }
        guard let mainWindowData = tooManyWindows.filtered(using: NSPredicate(format: "kCGWindowOwnerPID = \(pid)")).first as? NSDictionary else { return nil } 
        
        return mainWindowData.value(forKey: "kCGWindowNumber") as? Int
    }
    
    func reset() {
        window?.orderOut(self)
    }
    
}
