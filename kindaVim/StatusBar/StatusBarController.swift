import SwiftUI


class StatusBarController {

    @AppStorage(SettingsKeys.toggleMenuBarIcon) private var toggleMenuBarIcon: Bool = false
    
    var statusItem: NSStatusItem!
    
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
        
        let quitMenuItem = menu.addItem(withTitle: "Quit", action: #selector(quit), keyEquivalent: "q")
        quitMenuItem.target = self

        statusItem.menu = menu
    }
    
    @objc func preferences() {
        NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
        NSApp.activate(ignoringOtherApps: true)        
    }

    @objc func quit() {
        NSApplication.shared.terminate(self)
    }

}


