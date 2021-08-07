import AppKit


struct MainWindowInfo {
    
    let number: Int
    let height: CGFloat
    let width: CGFloat
    let x: CGFloat
    let y: CGFloat
    
}


struct HazeOverWindow: WindowProtocol {
    
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
            guard let mainWindowInfo = mainWindowInfo() else { return }
            guard let screen = screenOfMainWindowInFullScreenMode(using: mainWindowInfo) else { return }
            
            window.setFrame(NSRect(origin: screen.frame.origin, size: screen.frame.size), display: true)
            window.alphaValue = 0.2
            window.order(.above, relativeTo: mainWindowInfo.number)
        } else {
            guard let mainWindowInfo = mainWindowInfo() else { return }
            guard let screen = NSScreen.main else { return }
            
            window.setFrame(NSRect(origin: screen.frame.origin, size: screen.frame.size), display: true)
            window.alphaValue = 0.8
            window.order(.below, relativeTo: mainWindowInfo.number)
        }
    }
  
    func off() {
        window.orderOut(self)
    }
    
}
