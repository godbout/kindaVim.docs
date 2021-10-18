import Foundation
import SwiftUI
import AppKit
import KeyboardShortcuts
import KeyCombination


struct GlobalEventsController {
    
    @AppStorage(SettingsKeys.useCustomShortcutToEnterNormalMode) private static var useCustomShortcutToEnterNormalMode: Bool = false
    @AppStorage(SettingsKeys.appsToIgnore) private static var appsToIgnore: [String] = [
        "com.sublimetext.4",
        "com.googlecode.iterm2",
        "com.microsoft.VSCode",
        "com.jetbrains.PhpStorm",
        "com.github.atom"
    ] 
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyboardStrategy) private static var appsForWhichToEnforceKeyboardStrategy: [String] = [
        "com.apple.Safari"
    ]
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
        if onIgnoredApp() {
            return false
        }
        
        let enforceKeyboardStrategy = onAppForWhichToEnforceKeyboardStrategy()
        
        if inNormalModeOrOperatorPendingModeOrVisualMode() {
            guard let implementedKeyCombination = keyCombination else { return true }
            
            KindaVimEngine.shared.handle(
                keyCombination: implementedKeyCombination,
                enforceKeyboardStrategy: enforceKeyboardStrategy
            )

            return true
        }

        guard let implementedKeyCombination = keyCombination else { return false }

        if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
            KindaVimEngine.shared.enterNormalMode(enforceKeyboardStrategy: enforceKeyboardStrategy)
            
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
    
    private static func onAppForWhichToEnforceKeyboardStrategy() -> Bool {
        return appsForWhichToEnforceKeyboardStrategy.contains(
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
        if Self.useCustomShortcutToEnterNormalMode == true, let customKeyboardShortcut = KeyboardShortcuts.getShortcut(for: .enterNormalMode) {
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
