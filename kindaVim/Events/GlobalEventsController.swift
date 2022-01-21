import Foundation
import SwiftUI
import KeyboardShortcuts
import KeyCombination
import Sauce
import KeyboardStrategy
import VimEngineState


struct GlobalEventsController {
    
    @AppStorage(SettingsKeys.useCustomShortcutToEnterNormalMode) static var useCustomShortcutToEnterNormalMode: Bool = false
    @AppStorage(SettingsKeys.appsToIgnore) private static var appsToIgnore: Set<String> = [] 
    @AppStorage(SettingsKeys.appsForWhichToEnforcePGR) private static var appsForWhichToEnforcePGR: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceElectron) private static var appsForWhichToEnforceElectron: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyMapping) private static var appsForWhichToEnforceKeyMapping: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceNineOneOne) private static var appsForWhichToEnforceNineOneOne: Set<String> = []
    @AppStorage(SettingsKeys.enableKillSwitch) static var enableKillSwitch: Bool = false
    
    // to start thinking about how to charge :D
    // the first idea is you can type 69 characters before kV start functioning LMAO
    static var numberOfKeystrokes: Int = 0
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
        let appFamily = appFamilyForCurrentApp()        
        guard appFamily != .off else { return false }
        
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
               
                AppCore.shared.vimEngine.enterNormalMode(appFamily: appFamily)
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
            
            // this is especially for those who use `esc` to enter Normal Mode. because kV
            // steals `esc` from macOS, we need another way to send `esc` to macOS. the current way
            // is to press `esc` while in Normal Mode. that will go to Insert Mode, while sending
            // `esc` to macOS.
            guard escapeIsGlobalVimEngineHotkeyAndPressedWhileInNormalMode(implementedKeyCombination) == false else {
                AppCore.shared.vimEngine.enterInsertMode()
                let escapeCGEvent = KeyCombinationAdaptor.toCGEvents(from: implementedKeyCombination)
                escapeCGEvent.first?.tapPostEvent(KeyboardStrategy.proxy)
                
                return true
            }           
            
            guard killSwitchIsEnabledAndKillSwitchHotkeyIsPressed(implementedKeyCombination) == false else {
                AppCore.shared.vimEngine.enterInsertMode()
                
                return true
            }
            
            #if DEBUG
            doTheKeystrokeSubscriptionShit()
            #endif
            
            AppCore.shared.vimEngine.handle(keyCombination: implementedKeyCombination, appFamily: appFamily)
            
            return true       
        }
    }
    
    private static func appFamilyForCurrentApp() -> VimEngineAppFamily {
        guard let pid = AppCore.shared.axEngine.axFrontmostApplicationPID(), let frontmostApp = NSRunningApplication(processIdentifier: pid) else { return .auto }

        if onAppToIgnore(appBeing: frontmostApp) {
            return .off
        }
        
        if onAppForWhichToEnforcePGR(appBeing: frontmostApp) {
            return .pgR
        }
                    
        if onAppForWhichToEnforceElectron(appBeing: frontmostApp) {
            return .electron
        }
        
        if onAppForWhichToEnforceKeyMapping(appBeing: frontmostApp) {
            return .keyMapping
        }
        
        if onAppForWhichToEnforceNineOneOne(appBeing: frontmostApp) {
            return .nineOneOne
        }
        
        return .auto
    }
    
    private static func onAppToIgnore(appBeing app: NSRunningApplication) -> Bool {
        return appsToIgnore.contains(app.bundleIdentifier ?? "")
    }
    
    private static func onAppForWhichToEnforcePGR(appBeing app: NSRunningApplication) -> Bool {
        return appsForWhichToEnforcePGR.contains(app.bundleIdentifier ?? "")
    }
    
    private static func onAppForWhichToEnforceElectron(appBeing app: NSRunningApplication) -> Bool {
        return appsForWhichToEnforceElectron.contains(app.bundleIdentifier ?? "")
    }
    
    private static func onAppForWhichToEnforceKeyMapping(appBeing app: NSRunningApplication) -> Bool {
        return appsForWhichToEnforceKeyMapping.contains(app.bundleIdentifier ?? "")
    }
    
    private static func onAppForWhichToEnforceNineOneOne(appBeing app: NSRunningApplication) -> Bool {
        return appsForWhichToEnforceNineOneOne.contains(app.bundleIdentifier ?? "")
    }
    
    // if the user set up a custom KeyboardShortcut, use it. else we live for `esc`
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
    
    private static func escapeIsGlobalVimEngineHotkeyAndPressedWhileInNormalMode(_ keyCombination: KeyCombination) -> Bool {
        return AppCore.shared.vimEngine.currentMode == .normal
            && useCustomShortcutToEnterNormalMode == false
            && globalVimEngineHotkeyIsPressed(keyCombination)
    }
    
    private static func killSwitchIsEnabledAndKillSwitchHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {        
        return enableKillSwitch == true && killSwitchHotkeyIsPressed(keyCombination)
    }
    
    private static func killSwitchHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        guard let killSwitchKeyboardShortcut = KeyboardShortcuts.getShortcut(for: .killSwitch) else { return false }
        
        return Sauce.shared.keyCode(for: keyCombination.key) == killSwitchKeyboardShortcut.key!.rawValue
            && keyCombination.control == killSwitchKeyboardShortcut.modifiers.contains(.control)
            && keyCombination.option == killSwitchKeyboardShortcut.modifiers.contains(.option)
            && keyCombination.shift == killSwitchKeyboardShortcut.modifiers.contains(.shift)
            && keyCombination.command == killSwitchKeyboardShortcut.modifiers.contains(.command)
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
