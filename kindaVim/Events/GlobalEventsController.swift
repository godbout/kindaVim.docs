import Foundation
import SwiftUI
import KeyboardShortcuts
import KeyCombination
import Sauce
import KeyboardStrategy
import Common


struct GlobalEventsController {
    
    @AppStorage(SettingsKeys.useCustomShortcutToEnterNormalMode) static var useCustomShortcutToEnterNormalMode: Bool = false
    @AppStorage(SettingsKeys.appsToIgnore) private static var appsToIgnore: Set<String> = [] 
    @AppStorage(SettingsKeys.appsForWhichToEnforcePGR) private static var appsForWhichToEnforcePGR: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceElectron) private static var appsForWhichToEnforceElectron: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyMapping) private static var appsForWhichToEnforceKeyMapping: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceNineOneOne) private static var appsForWhichToEnforceNineOneOne: Set<String> = []
    @AppStorage(SettingsKeys.enableKillSwitch) static var enableKillSwitch: Bool = false
    
    
    static func handle(keyCombination: KeyCombination?) -> Bool {
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
                
                let appFamily = appFamilyForCurrentApp()        
                guard appFamily != .off else { return false }
               
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
            let subscriptionPopover = AppCore.shared.statusBarController.subscriptionPopover
            
            // this is especially for those who use `esc` to enter Normal Mode. because kV
            // steals `esc` from macOS, we need another way to send `esc` to macOS. the current way
            // is to press `esc` while in Normal Mode. that will go to Insert Mode, while sending
            // `esc` to macOS.
            guard escapeIsGlobalVimEngineHotkeyAndPressedWhileInNormalMode(implementedKeyCombination) == false else {
                AppCore.shared.vimEngine.enterInsertMode()                
                subscriptionPopover?.isShown == true ? subscriptionPopover?.close() : ()
                let escapeCGEvent = KeyCombinationAdaptor.toCGEvents(from: implementedKeyCombination)
                escapeCGEvent.first?.tapPostEvent(KeyboardStrategy.proxy)
                
                return true
            }           
          
            guard killSwitchIsEnabledAndKillSwitchHotkeyIsPressed(implementedKeyCombination) == false else {
                AppCore.shared.vimEngine.enterInsertMode()
                subscriptionPopover?.isShown == true ? subscriptionPopover?.close() : ()
                
                return true
            }
            
            #if DEBUG     
            guard AppCore.shared.licensing.userHasEarnedRightsToAbuse else {
                let statusItemButton = AppCore.shared.statusBarController.statusItem.button
                                                
                subscriptionPopover?.animates = false
                subscriptionPopover?.close()
                subscriptionPopover?.behavior = .transient
                subscriptionPopover?.contentViewController?.view = NSHostingView(rootView: BedtimePopoverView(sentence: Licensing.bedtimeSentences.randomElement()!))
                subscriptionPopover?.animates = true
                
                // even without a license you're allowed to go back to IM awww LOL how generous
                guard [.A, .a, .C, .c, .I, .i, .O, .o, .S, .s].contains(implementedKeyCombination.vimKey) == false else {
                    AppCore.shared.vimEngine.handle(keyCombination: implementedKeyCombination, appFamily: appFamilyForCurrentApp())                    
                    
                    return true
                }
                
                subscriptionPopover?.show(relativeTo: statusItemButton!.bounds, of: statusItemButton!, preferredEdge: NSRectEdge.minY)
                subscriptionPopover?.contentViewController?.view.window?.makeKey()
              
                return true
            }
            #endif
                        
            AppCore.shared.vimEngine.handle(keyCombination: implementedKeyCombination, appFamily: appFamilyForCurrentApp())
            
            return true       
        }
    }
    
    private static func appFamilyForCurrentApp() -> AppFamily {
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
        
}
