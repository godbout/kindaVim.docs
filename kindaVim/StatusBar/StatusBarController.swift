import AppKit
import Preferences


class StatusBarController {
    
    private var statusItem: NSStatusItem!
    private lazy var preferencesController = PreferencesController()
    
    init() {
        setUpStatusItem()
        setUpStatusItemMenu()
    }
    
    
    private func setUpStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.title = "kV"
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
    }

    @objc func quit() {
        NSApplication.shared.terminate(self)
    }

}


