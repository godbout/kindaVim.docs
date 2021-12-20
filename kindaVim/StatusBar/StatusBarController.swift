import SwiftUI
import Sparkle


class StatusBarController {

    @AppStorage(SettingsKeys.toggleMenuBarIcon) private var toggleMenuBarIcon: Bool = false
    var statusItem: NSStatusItem!
    var updater = Updater()    
    
    init() {
        setUpStatusItem()
        setUpStatusItemMenu()
    }
    
    
    private func setUpStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.image = toggleMenuBarIcon == true ? NSImage(named: "MenuBarIconEmpty") : NSImage(named: "MenuBarIconFull")
    }
    
    private func setUpStatusItemMenu() {
        let menu = NSMenu()
        
        let preferencesMenuItem = menu.addItem(withTitle: "Preferences...", action: #selector(preferences), keyEquivalent: ",")
        preferencesMenuItem.target = self
        menu.addItem(NSMenuItem.separator())
                
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String? ?? "⚠️" 
        menu.addItem(withTitle: "kindaVim " +  versionNumber, action: nil, keyEquivalent: "")
                
        let checkForUpdatesMenuItem = menu.addItem(withTitle: "Check for Updates...", action: #selector(checkForUpdates), keyEquivalent: "u")
        checkForUpdatesMenuItem.target = self                
        menu.addItem(NSMenuItem.separator())
        
        let quitMenuItem = menu.addItem(withTitle: "Quit", action: #selector(quit), keyEquivalent: "q")
        quitMenuItem.target = self

        statusItem.menu = menu
    }

    @objc func preferences() {
        NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
        NSApp.activate(ignoringOtherApps: true)        
    }
    
    @objc func checkForUpdates() {
        updater.checkForUpdates()
    }

    @objc func quit() {
        NSApplication.shared.terminate(self)
    }    

}