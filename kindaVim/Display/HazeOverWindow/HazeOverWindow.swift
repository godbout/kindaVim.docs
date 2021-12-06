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
        window.animationBehavior = .none
        window.collectionBehavior = [.canJoinAllSpaces, .transient]
        window.ignoresMouseEvents = true
    }
    
    
    func on() {
        guard let mainWindowInfo = mainWindowInfo() else { 
            guard let mainScreen = NSScreen.main else { return }

            window.setFrame(NSRect(origin: mainScreen.frame.origin, size: mainScreen.frame.size), display: true)
            window.alphaValue = 0.2
            
            return
        }
        guard let screen = screenWhereMainWindowIs(using: mainWindowInfo) else { return }
        
        window.setFrame(NSRect(origin: screen.frame.origin, size: screen.frame.size), display: true)
        
        if mainWindowIsInFullScreenMode() {
            window.alphaValue = 0.2
            window.order(.above, relativeTo: mainWindowInfo.number)            
        } else {
            window.alphaValue = 0.8
            window.order(.below, relativeTo: mainWindowInfo.number)
        }
    }
  
    func off() {
        window.animator().alphaValue = 0
    }
    
}
