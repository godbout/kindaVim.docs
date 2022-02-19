import AppKit
import SwiftUI
import KeyCombination


final class CharactersWindow: WindowProtocol {
    
    private var window: NSWindow
    private var ongoingMove: String = ""
    // static here because of mutating and closure and self issue, not sure
    // yet how to do that better. but it works. and it's not an important part
    // of the app. but still. will i be able to sleep tonight.
    private static var timer: Timer?
    
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
        window.level = .popUpMenu
        window.animationBehavior = .utilityWindow
        window.collectionBehavior = [.transient]
        
        NotificationCenter.default.addObserver(self, selector: #selector(didMove), name: NSWindow.didMoveNotification, object: window)        
    }
    
    @objc private func didMove() {
        Self.timer?.invalidate()
        self.hide()
    }
        
    func show(_ ongoingMove: String) {
        Self.timer?.invalidate()
        
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
        Self.timer = Timer.scheduledTimer(
            withTimeInterval: 1.28,
            repeats: false,
            block: { [unowned self] _ in self.window.orderOut(self) }
        )
    }
    
}
