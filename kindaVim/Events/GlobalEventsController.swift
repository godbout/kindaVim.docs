import Foundation
import SwiftUI
import KeyboardShortcuts
import KeyCombination
import Sauce


struct GlobalEventsController {
    
    @AppStorage(SettingsKeys.useCustomShortcutToEnterNormalMode) static var useCustomShortcutToEnterNormalMode: Bool = false
    @AppStorage(SettingsKeys.appsToIgnore) private static var appsToIgnore: Set<String> = [] 
    @AppStorage(SettingsKeys.appsForWhichToUseHybridMode) private static var appsForWhichToUseHybridMode: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyboardStrategy) private static var appsForWhichToEnforceKeyboardStrategy: Set<String> = []
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
        let appMode = appModeForCurrentApp()        
        guard appMode != .off else { return false }
        
        guard let implementedKeyCombination = keyCombination else { return true }
        
        if inInsertMode() {
            if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
                #if DEBUG
                if AppCore.shared.vimEngine.showCharactersTyped == true {
                    AppCore.shared.vimEngine.display.ongoingMove(add: implementedKeyCombination)
                    AppCore.shared.vimEngine.display.showOngoingMove()
                }
                #endif
                
                AppCore.shared.vimEngine.enterNormalMode(appMode: appMode)
                
                return true
            } else {
                return false
            }
        }
        
        if inNormalModeOrOperatorPendingModeOrVisualMode() {
            if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
                AppCore.shared.vimEngine.enterInsertMode()
            } else {
                AppCore.shared.vimEngine.handle(keyCombination: implementedKeyCombination, appMode: appMode)
            }
                        
            return true
        }
        
        return false
    }
    
    private static func appModeForCurrentApp() -> AppMode {
        if onAppToIgnore() {
            return .off
        }
        
        if onAppForWhichToUseHybridMode() {
            return .pgR
        }
        
        if onAppForWhichToEnforceKeyboardStrategy() {
            return .keyMapping
        }
        
        return .auto
    }
    
    private static func onAppToIgnore() -> Bool {
        return appsToIgnore.contains(
            NSWorkspace.shared.frontmostApplication?.bundleIdentifier ?? ""
        )
    }
    
    private static func onAppForWhichToUseHybridMode() -> Bool {
        return appsForWhichToUseHybridMode.contains(
            NSWorkspace.shared.frontmostApplication?.bundleIdentifier ?? ""
        )
    }
    
    private static func onAppForWhichToEnforceKeyboardStrategy() -> Bool {
        return appsForWhichToEnforceKeyboardStrategy.contains(
            NSWorkspace.shared.frontmostApplication?.bundleIdentifier ?? ""
        )
    }
    
    private static func inNormalModeOrOperatorPendingModeOrVisualMode() -> Bool {
        return AppCore.shared.vimEngine.currentMode == .normal
            || AppCore.shared.vimEngine.currentMode == .operatorPendingForNormalMode
            || AppCore.shared.vimEngine.currentMode == .visual
            || AppCore.shared.vimEngine.currentMode == .operatorPendingForVisualMode
    }
    
    private static func inInsertMode() -> Bool {
        return AppCore.shared.vimEngine.currentMode == .insert
    }
    
    // if the user set up a custom KeyboardShortcut, use it
    // else we live for escape
    private static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        if Self.useCustomShortcutToEnterNormalMode == true, let customKeyboardShortcut = KeyboardShortcuts.getShortcut(for: .enterNormalMode) {
            return Sauce.shared.keyCode(for: keyCombination.key) == customKeyboardShortcut.key!.rawValue
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
