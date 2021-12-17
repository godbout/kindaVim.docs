import SwiftUI
import Sauce


class AppCore {
    
    static var shared = AppCore()

    var statusBarController: StatusBarController!
    var eventTapController: EventTapController!
    var vimEngine: KindaVimEngine!

    var accessibilityElementAdaptorTestingWindow: NSWindow!
    
    private init() {}


    func setUp() {
        setUpStatusBar()
        #if !CITESTING
        setUpEventTap()
        #endif
        setUpKeyboardLayoutsKeyCodes()
        setUpVimEngine()
        
        
        NSApplication.shared.hide(self)
        
        #if UITESTING
        setUpUITestingWindow()
        #endif
    }
    
    func setUpAgainIfNecessary() {
        setUp()
    }

    private func setUpUITestingWindow() {
        NSApplication.shared.setActivationPolicy(.regular)
        NSApplication.shared.activate(ignoringOtherApps: true)
        
        let contentView = UITestView()

        accessibilityElementAdaptorTestingWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 680, height: 400),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        accessibilityElementAdaptorTestingWindow.contentView = NSHostingView(rootView: contentView)
        accessibilityElementAdaptorTestingWindow.makeKeyAndOrderFront(nil)
    }

    private func setUpStatusBar() {
        guard statusBarController == nil else { return }
        
        statusBarController = StatusBarController()
    }

    private func setUpEventTap() {
        guard eventTapController == nil else {
            CGEvent.tapEnable(tap: EventTapController.eventTap, enable: true)
            
            return
        }
        
        eventTapController = EventTapController()
    }
        
    private func setUpKeyboardLayoutsKeyCodes() {
        // lol
        _ = Sauce.shared.keyCode(for: .six)
        _ = Sauce.shared.keyCode(for: .nine)
    }

    private func setUpVimEngine() {
        guard vimEngine == nil else { return }
        
        @AppStorage(SettingsKeys.toggleHazeOverWindow) var toggleHazeOverWindow: Bool = true
        @AppStorage(SettingsKeys.toggleMenuBarIcon) var toggleMenuBarIcon: Bool = false
        @AppStorage(SettingsKeys.showCharactersTyped) var showCharactersTyped: Bool = false
        @AppStorage(SettingsKeys.jkMapping) var jkMapping: Bool = true
        
        vimEngine = KindaVimEngine()
        vimEngine.statusItem = statusBarController.statusItem
        vimEngine.toggleHazeOverWindow = toggleHazeOverWindow
        vimEngine.toggleMenuBarIcon = toggleMenuBarIcon
        vimEngine.showCharactersTyped = showCharactersTyped
        vimEngine.jkMapping = jkMapping
    }

}

