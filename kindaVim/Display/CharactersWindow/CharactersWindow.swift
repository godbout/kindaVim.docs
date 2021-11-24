import AppKit
import SwiftUI
import KeyCombination


struct CharactersWindow: WindowProtocol {
    
    var window: NSWindow
    var ongoingMove: String = ""
    
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
        window.isRestorable = true
        window.level = .floating
        window.animationBehavior = .utilityWindow
        window.collectionBehavior = [.canJoinAllSpaces, .transient]
    }
    
    func show(_ ongoingMove: String) {
        window.contentView = NSHostingView(rootView: CharactersView(ongoingMove: ongoingMove))
        window.orderFrontRegardless()
    }
        
    private func screenToShowTheCharactersWindowOnto() -> NSScreen? {
        let screen: NSScreen?
        
        if let mainWindowInfo = mainWindowInfo() {
            screen = screenWhereMainWindowIs(using: mainWindowInfo)
        } else {
            screen = NSScreen.main
        }
        
        return screen
    }
    
    func hide() {
        Timer.scheduledTimer(
            withTimeInterval: 1.28,
            repeats: false,
            block: { _ in window.orderOut(self)}
        )
    }
    
}
