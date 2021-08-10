import AppKit
import Foundation

struct GlobalEventsController {
    
    static let appsToIgnore: [String] = [
        "com.sublimetext.4",
        "com.googlecode.iterm2",
        "com.microsoft.VSCode",
        "com.jetbrains.PhpStorm",
        "com.github.atom",
    ]
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
        if onIgnoredApp() {
            return false
        }
        
        if inNormalModeOrOperatorPendingModeOrVisualMode() {
            guard let implementedKeyCombination = keyCombination else { return true }

            KindaVimEngine.shared.handle(keyCombination: implementedKeyCombination)

            return true
        }

        guard let implementedKeyCombination = keyCombination else { return false }

        if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
            KindaVimEngine.shared.enterNormalMode()
            
            print("enter Normal Mode")
            
            return true
        }

        return false
    }
    
    private static func onIgnoredApp() -> Bool {
        return appsToIgnore.contains(
            NSWorkspace.shared.frontmostApplication?.bundleIdentifier ?? ""
        )
    }
    
    private static func inNormalModeOrOperatorPendingModeOrVisualMode() -> Bool {
        return KindaVimEngine.shared.currentMode == .normal
            || KindaVimEngine.shared.currentMode == .operatorPendingForNormalMode
            || KindaVimEngine.shared.currentMode == .visual
            || KindaVimEngine.shared.currentMode == .operatorPendingForVisualMode
    }
    
    private static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        // temporary for escape to enter Normal Mode
        // and escape again to send escape key to macOS
        return keyCombination.key == .escape
            && keyCombination.control == false
            && keyCombination.option == false
            && keyCombination.shift == false
            && keyCombination.command == false
    }
    
}
