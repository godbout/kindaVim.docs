import AppKit
import Foundation

struct GlobalEventsController {
    
    static let appsToIgnore: [String] = [
        "com.sublimetext.4",
    ]
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
        if onIgnoredApp() {
            return false
        }
        
        if inCommandModeOrOperatorPendingMode() {
            guard let implementedKeyCombination = keyCombination else { return true }

            VimEngine.shared.handle(keyCombination: implementedKeyCombination)

            return true
        }

        guard let implementedKeyCombination = keyCombination else { return false }

        if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
            VimEngine.shared.enterCommandMode()
            
            print("enter command mode")
            
            return true
        }

        return false
    }
    
    private static func onIgnoredApp() -> Bool {
        return appsToIgnore.contains(
            NSWorkspace.shared.frontmostApplication?.bundleIdentifier ?? ""
        )
    }
    
    private static func inCommandModeOrOperatorPendingMode() -> Bool {
        return VimEngine.shared.currentMode == .command
            || VimEngine.shared.currentMode == .operatorPending
    }
    
    private static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        // temporary for escape to enter Command Mode
        // and escape again to send escape key to macOS
        return keyCombination.key == .escape
            && keyCombination.control == false
            && keyCombination.option == false
            && keyCombination.shift == false
            && keyCombination.command == false
    }
    
}
