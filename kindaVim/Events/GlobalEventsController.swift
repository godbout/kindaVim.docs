import Foundation

struct GlobalEventsController {
    
    static func stole(keyCombination: KeyCombination?) -> Bool {
        if VimEngine.shared.currentMode != .insert {
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
    
    private static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        // temporary for escape to enter Command Mode
        // and escape again to send escape key to macOS
        return keyCombination.key == .escape
            && keyCombination.control == false
            && keyCombination.option == false
            && keyCombination.shift == false
    }
    
}
