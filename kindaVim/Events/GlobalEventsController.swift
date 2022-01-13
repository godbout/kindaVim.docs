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
    
    // to start thinking about how to charge :D
    // the first idea is you can type 69 characters before kV start functioning LMAO
    static var numberOfKeystrokes: Int = 0
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
        let appMode = appModeForCurrentApp()        
        guard appMode != .off else { return false }
        
        switch AppCore.shared.vimEngine.currentMode {
        case .insert:
            guard let implementedKeyCombination = keyCombination else { return false }
            
            if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
                #if DEBUG
                if AppCore.shared.vimEngine.showCharactersTyped == true {
                    AppCore.shared.vimEngine.display.ongoingMove(add: implementedKeyCombination)
                    AppCore.shared.vimEngine.display.showOngoingMove()
                }
                #endif
               
                AppCore.shared.vimEngine.enterNormalMode(appMode: appMode)
                AppCore.shared.inputFieldObserver.startObserving()
                
                return true
            } else {
                return false
            }
        // Global Keyboard Shortcuts have to be handled here rather than from within kVE
        // because they're dynamic. i'm not sure how we could check whether a dynamic
        // move is implemented or not within kVE.
        // so they're handled by GEC. which makes sense, and separate concerns AWWW
        case .normal, .operatorPendingForNormalMode, .visual, .operatorPendingForVisualMode:
            guard let implementedKeyCombination = keyCombination else { return true }
            
            // TODO: dirty kill switch for now
            if implementedKeyCombination.key == .j, 
                implementedKeyCombination.control == true,
                implementedKeyCombination.option == true,
                implementedKeyCombination.command == true {
                AppCore.shared.vimEngine.enterInsertMode()
            } else {
                #if DEBUG
                doTheKeystrokeSubscriptionShit()
                #endif
                
                AppCore.shared.vimEngine.handle(keyCombination: implementedKeyCombination, appMode: appMode)
            }
            
            return true       
        }
    }
    
    private static func appModeForCurrentApp() -> AppMode {
        guard let pid = AppCore.shared.axEngine.axFrontmostApplicationPID(), let frontmostApp = NSRunningApplication(processIdentifier: pid) else { return .auto }

        if onAppToIgnore(appBeing: frontmostApp) {
            return .off
        }
        
        if onAppForWhichToUseHybridMode(appBeing: frontmostApp) {
            return .pgR
        }
        
        if onAppForWhichToEnforceKeyboardStrategy(appBeing: frontmostApp) {
            return .keyMapping
        }
        
        return .auto
    }
    
    private static func onAppToIgnore(appBeing app: NSRunningApplication) -> Bool {
        return appsToIgnore.contains(app.bundleIdentifier ?? "")
    }
    
    private static func onAppForWhichToUseHybridMode(appBeing app: NSRunningApplication) -> Bool {
        return appsForWhichToUseHybridMode.contains(app.bundleIdentifier ?? "")
    }
    
    private static func onAppForWhichToEnforceKeyboardStrategy(appBeing app: NSRunningApplication) -> Bool {
        return appsForWhichToEnforceKeyboardStrategy.contains(app.bundleIdentifier ?? "")
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
    
    private static func doTheKeystrokeSubscriptionShit() {
        #if DEBUG
        // you sleep for now. annoying LOL
//        numberOfKeystrokes += 1
//        
//        if numberOfKeystrokes > 689 {
//            let alert: NSAlert = NSAlert()
//            alert.messageText = String(numberOfKeystrokes)
//            numberOfKeystrokes = 0
//            alert.addButton(withTitle: "OK")
//            _ = alert.runModal()
//        }
        #endif
    }
    
}
