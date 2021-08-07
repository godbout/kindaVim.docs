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
        guard let mainWindowInfo = mainWindowInfo() else { return }
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
        window.orderOut(self)
    }
    
}
