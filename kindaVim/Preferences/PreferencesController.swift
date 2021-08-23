import AppKit
import Preferences


extension Preferences.PaneIdentifier {
    
    static let general = Self("general")
    static let strategies = Self("strategies")
    static let visuals = Self("visuals")
    
}


struct PreferencesController {
    
    private var GeneralPreferenceController: () -> PreferencePane = {
        let identifier = Preferences.PaneIdentifier.general
        let title = "General"
        let toolbarIcon: NSImage
               
        if #available(macOS 11.0, *) {
            toolbarIcon = NSImage(systemSymbolName: "gearshape", accessibilityDescription: "General Preferences")!
        } else {
            toolbarIcon = NSImage(named: NSImage.preferencesGeneralName)!
        }
        
        let paneView = Preferences.Pane(identifier: identifier, title: title, toolbarIcon: toolbarIcon) {
            GeneralPane()
        }
        
        return Preferences.PaneHostingController(pane: paneView)
    }
    
    private var StrategiesPreferenceController: () -> PreferencePane = {
        let identifier = Preferences.PaneIdentifier.strategies
        let title = "Strategies"
        let toolbarIcon: NSImage
        
        if #available(macOS 11.0, *) {
            toolbarIcon = NSImage(systemSymbolName: "keyboard", accessibilityDescription: "Strategies Preferences")!
        } else {
            toolbarIcon = NSImage(named: NSImage.networkName)!
        }
       
        let paneView = Preferences.Pane(identifier: identifier, title: title, toolbarIcon: toolbarIcon) {
            StrategiesPane()
        }
        
        return Preferences.PaneHostingController(pane: paneView)
    }
    
    private var VisualsPreferenceController: () -> PreferencePane = {
        let identifier = Preferences.PaneIdentifier.visuals
        let title = "Visuals"
        let toolbarIcon: NSImage
        
        if #available(macOS 11.0, *) {
            toolbarIcon = NSImage(systemSymbolName: "eyeglasses", accessibilityDescription: "Visuals Preferences")!
        } else {
            toolbarIcon = NSImage(named: NSImage.computerName)!
        }
       
        let paneView = Preferences.Pane(identifier: identifier, title: title, toolbarIcon: toolbarIcon) {
            VisualsPane()
        }
        
        return Preferences.PaneHostingController(pane: paneView)
    }

    private lazy var preferences: [PreferencePane] = [
        GeneralPreferenceController(),
        StrategiesPreferenceController(),
        VisualsPreferenceController()
    ]
   
    lazy var window = PreferencesWindowController(
        preferencePanes: preferences,
        animated: true
    )
    
}
