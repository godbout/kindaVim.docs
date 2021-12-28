import SwiftUI


enum HazeOverFullScreenMode {
    
    case auto
    case fullScreen
    case nonFullScreen
    
}


struct MainWindowInfo {
    
    let number: Int
    let height: CGFloat
    let width: CGFloat
    let x: CGFloat
    let y: CGFloat
    
}


struct HazeOverWindow: WindowProtocol {
    
    @AppStorage(SettingsKeys.hazeOverWindowFullScreenOpacity) private var hazeOverWindowFullScreenOpacity: Double = 0.2
    @AppStorage(SettingsKeys.hazeOverWindowNonFullScreenOpacity) private var hazeOverWindowNonFullScreenOpacity: Double = 0.8
    
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
    
    
    func on(fullScreenMode: HazeOverFullScreenMode = .auto) {
        guard let mainWindowInfo = mainWindowInfo() else { 
            guard let mainScreen = NSScreen.main else { return }

            window.setFrame(NSRect(origin: mainScreen.frame.origin, size: mainScreen.frame.size), display: true)
            window.alphaValue = hazeOverWindowFullScreenOpacity
            
            return
        }
        guard let screen = screenWhereMainWindowIs(using: mainWindowInfo) else { return }
        
        window.setFrame(NSRect(origin: screen.frame.origin, size: screen.frame.size), display: true)
        
        // TODO: refactor
        switch fullScreenMode {
        case .auto:
            if mainWindowIsInFullScreenMode() {
                window.alphaValue = hazeOverWindowFullScreenOpacity
                window.order(.above, relativeTo: mainWindowInfo.number)                
            } else {
                window.alphaValue = hazeOverWindowNonFullScreenOpacity
                window.order(.below, relativeTo: mainWindowInfo.number)
            }
        case .fullScreen:
            window.alphaValue = hazeOverWindowFullScreenOpacity
            window.order(.above, relativeTo: mainWindowInfo.number)
        case .nonFullScreen:
            window.alphaValue = hazeOverWindowNonFullScreenOpacity
            window.order(.below, relativeTo: mainWindowInfo.number)
        }
    }
  
    func off() {
        window.animator().alphaValue = 0
    }
    
}
