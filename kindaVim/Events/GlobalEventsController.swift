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
        
        guard let implementedKeyCombination = keyCombination else { return true }
        
        switch AppCore.shared.vimEngine.currentMode {
        case .insert:
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
        // there's a difference here between the custom KeyboardShortcut and the default `escape` one because in
        // the kindaVimEngine we can grab `escape`, but we can't grab a dynamic custom one. so for the custom one we
        // have to enter IM from here, not from within kVEngine. why not doing the same for `escape`? because as much as
        // we can, those things have to be handled by the kVEngine, not by the GEC.
        case .normal, .operatorPendingForNormalMode, .visual, .operatorPendingForVisualMode:
            #if DEBUG
            doTheKeystrokeSubscriptionShit()
            #endif
            
            if globalVimEngineHotkeyIsPressed(implementedKeyCombination), implementedKeyCombination != KeyCombination(key: .escape) {
                AppCore.shared.vimEngine.enterInsertMode()
            } else {
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
