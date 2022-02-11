import SwiftUI
import Sauce
import AXEngine


class AppCore {
    
    static var shared = AppCore()

    var updaterController: UpdaterController!
    var statusBarController: StatusBarController!
    var eventTapController: EventTapController!
    var axEngine: AXEngine!
    var inputFieldObserver: InputFieldObserver!
    var vimEngine: KindaVimEngine!
    var licensing: Licensing!

    var accessibilityElementAdaptorTestingWindow: NSWindow!
    
    private init() {}


    func setUp() {
        #if !UITESTING
        setUpUpdater()
        #endif
        setUpStatusBar()
        #if !CITESTING
        setUpEventTap()
        #endif
        setUpKeyboardLayoutsKeyCodes()
        setUpAXEngine()
        setUpInputFieldObserver()
        setUpLicensing()
        setUpVimEngine()
        
        NSApplication.shared.hide(self)
        
        #if UITESTING
        setUpUITestingWindow()
        #endif
    }
    
    func setUpAgainIfNecessary() {
        setUp()
    }

    private func setUpUpdater() {
        guard updaterController == nil else { return }
        
        updaterController = UpdaterController()
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
    
    private func setUpAXEngine() {
        guard axEngine == nil else { return }
        
        axEngine = AXEngine()
    }
        
    private func setUpInputFieldObserver() {
        guard inputFieldObserver == nil else { return }
        
        inputFieldObserver = InputFieldObserver()
    }
    
    private func setUpLicensing() {
        guard licensing == nil else { return }
        
        licensing = Licensing()
        licensing.verify()
    }

    private func setUpVimEngine() {
        guard vimEngine == nil else { return }
        
        @AppStorage(SettingsKeys.toggleHazeOverWindow) var toggleHazeOverWindow: Bool = true
        @AppStorage(SettingsKeys.toggleMenuBarIcon) var toggleMenuBarIcon: Bool = false
        @AppStorage(SettingsKeys.showCharactersTyped) var showCharactersTyped: Bool = false
        @AppStorage(SettingsKeys.jkMapping) var jkMapping: Bool = true
        
        vimEngine = KindaVimEngine(axEngine: axEngine, inputFieldObserver: inputFieldObserver)
        vimEngine.statusItem = statusBarController.statusItem
        vimEngine.toggleHazeOverWindow = toggleHazeOverWindow
        vimEngine.toggleMenuBarIcon = toggleMenuBarIcon
        vimEngine.showCharactersTyped = showCharactersTyped
        vimEngine.jkMapping = jkMapping
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
        
}
