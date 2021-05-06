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
        return keyCombination.key == .escape && keyCombination.command == true
    }
    
}
