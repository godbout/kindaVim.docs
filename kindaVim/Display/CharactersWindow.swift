import AppKit
import SwiftUI


struct CharactersWindow: WindowProtocol {
    
    var window: NSWindow
    static var lettersTyped = ""
    
    init() {
        window = NSWindow(
            contentRect: NSRect(),
            styleMask: [],
            backing: .buffered,
            defer: true
        )
        
        window.backgroundColor = .clear
        window.alphaValue = 0.7
        window.isMovableByWindowBackground = true
        window.level = .floating
        window.animationBehavior = .utilityWindow
        window.collectionBehavior = [.canJoinAllSpaces, .transient]
    }
    
    
    func show(lastCharacterBeing character: Character) {
        let screen: NSScreen?
        
        if let mainWindowInfo = mainWindowInfo() {
            screen = screenWhereMainWindowIs(using: mainWindowInfo)
        } else {
            screen = NSScreen.main
        }
        
        guard let theScreen = screen else { return } 
        
        window.setFrame(NSRect(x: theScreen.frame.origin.x + 50, y: theScreen.frame.origin.y + 80, width: 269, height: 60), display: true)
               
        if Self.lettersTyped.count > 10 {
            Self.lettersTyped = ""
        }
        
        Self.lettersTyped.append(character)
        
        window.contentView = NSHostingView(rootView: CharactersView(lettersTyped: Self.lettersTyped))
        window.orderFrontRegardless()
    }
    
    func hide() {
        Self.lettersTyped = ""
        
        Timer.scheduledTimer(
            withTimeInterval: 0.69,
            repeats: false,
            block: { _ in window.orderOut(self )}
        )
    }
    
}
