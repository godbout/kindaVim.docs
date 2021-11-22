import AppKit
import SwiftUI
import KeyCombination


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
        window.isRestorable = true
        window.level = .floating
        window.animationBehavior = .utilityWindow
        window.collectionBehavior = [.canJoinAllSpaces, .transient]
    }
    
    
    func show(lastKeyCombinationBeing keyCombination: KeyCombination) {
        if Self.lettersTyped.count > 10 || Self.lettersTyped.contains("control") {
            Self.lettersTyped = ""
        }
        
        // ok for now we just have VimKeys with control so let's get lazy
        if keyCombination.control == true {
            Self.lettersTyped = "control " + String(keyCombination.character)
        } else {
            switch keyCombination.key {
            case .enter:
                Self.lettersTyped = "return"
            case .escape:
                Self.lettersTyped = "esc"
            default:
                Self.lettersTyped.append(keyCombination.character)
            }
        }

        window.contentView = NSHostingView(rootView: CharactersView(lettersTyped: Self.lettersTyped))
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
        Self.lettersTyped = ""
        
        Timer.scheduledTimer(
            withTimeInterval: 1.28,
            repeats: false,
            block: { _ in window.orderOut(self )}
        )
    }
    
}
