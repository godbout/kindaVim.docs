import AppKit
import SwiftUI


struct CharactersWindow {
    
    var window: NSWindow
    static var lettersTyped = ""
    
    init() {
        window = NSWindow(
            contentRect: NSRect(x: 50, y: 80, width: 269, height: 60),
            styleMask: [],
            backing: .buffered,
            defer: true
        )
        
        window.backgroundColor = .clear
        window.alphaValue = 0.7
        window.isMovableByWindowBackground = true
        window.level = .floating
        window.animationBehavior = .utilityWindow
    }
    
    
    func show(lastCharacterBeing character: Character) {
        if Self.lettersTyped.count > 10 {
            Self.lettersTyped = ""
        }
        
        Self.lettersTyped.append(character)
        
        let charactersView = CharactersView(lettersTyped: Self.lettersTyped)
        
        window.contentView = NSHostingView(rootView: charactersView)
        window.orderFrontRegardless()
    }
    
    func hide() {
        Timer.scheduledTimer(
            withTimeInterval: 0.69,
            repeats: false,
            block: { _ in window.orderOut(self )}
        )
    }
    
}
