import AppKit
import Foundation
import KeyboardShortcuts
import Defaults
import KeyCombination


struct GlobalEventsController {
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
        if onIgnoredApp() {
            return false
        }
        
        if inNormalModeOrOperatorPendingModeOrVisualMode() {
            guard let implementedKeyCombination = keyCombination else { return true }

            KindaVimEngine.shared.handle(
                keyCombination: implementedKeyCombination,
                enforceKeyboardStrategy: onAppForWhichToEnforceKeyboardStrategy()
            )

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
        return Defaults[.appsToIgnore].contains(
            NSWorkspace.shared.frontmostApplication?.bundleIdentifier ?? ""
        )
    }
    
    private static func onAppForWhichToEnforceKeyboardStrategy() -> Bool {
        return Defaults[.appsForWhichToEnforceKeyboardStrategy].contains(
            NSWorkspace.shared.frontmostApplication?.bundleIdentifier ?? ""
        )
    }
    
    private static func inNormalModeOrOperatorPendingModeOrVisualMode() -> Bool {
        return KindaVimEngine.shared.currentMode == .normal
            || KindaVimEngine.shared.currentMode == .operatorPendingForNormalMode
            || KindaVimEngine.shared.currentMode == .visual
            || KindaVimEngine.shared.currentMode == .operatorPendingForVisualMode
    }
    
    // if the user set up a custom KeyboardShortcut, use it
    // else we live for escape
    private static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        if Defaults[.useCustomShortcutToEnterNormalMode] == true, let customKeyboardShortcut = KeyboardShortcuts.getShortcut(for: .enterNormalMode) {
            return keyCombination.key.rawValue == customKeyboardShortcut.key!.rawValue
                && keyCombination.control == customKeyboardShortcut.modifiers.contains(.control)
                && keyCombination.option == customKeyboardShortcut.modifiers.contains(.option)
                && keyCombination.shift == customKeyboardShortcut.modifiers.contains(.shift)
                && keyCombination.command == customKeyboardShortcut.modifiers.contains(.command)
        }

        return keyCombination.key == .escape
            && keyCombination.control == false
            && keyCombination.option == false
            && keyCombination.shift == false
            && keyCombination.command == false
    }
    
}
