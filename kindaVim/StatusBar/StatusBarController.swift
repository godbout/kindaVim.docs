import AppKit
import Preferences


class StatusBarController {
    
    var statusItem: NSStatusItem!
    
    private lazy var preferencesWindowController = PreferencesWindowController(
        panes: [
            Preferences.Pane(
                identifier: Preferences.PaneIdentifier.general,
                title: "General",
                toolbarIcon: NSImage(named: NSImage.preferencesGeneralName)!
            ) {
                GeneralPane()
            },
            Preferences.Pane(
                identifier: Preferences.PaneIdentifier.strategies,
                title: "Strategies",
                toolbarIcon: NSImage(named: NSImage.columnViewTemplateName)!
            ) {
                StrategiesPane()
            }
        ],
        animated: false
    )
    
    
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
        preferencesWindowController.show(preferencePane: .general)
    }

    @objc func quit() {
        NSApplication.shared.terminate(self)
    }

}


