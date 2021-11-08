import SwiftUI


class AppState {
    
    static var shared = AppState()

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

    private func setUpVimEngine() {
        guard vimEngine == nil else { return }
        
        @AppStorage(SettingsKeys.toggleHazeOverWindow) var toggleHazeOverWindow: Bool = true
        @AppStorage(SettingsKeys.showCharactersTyped) var showCharactersTyped: Bool = false
        @AppStorage(SettingsKeys.jkMapping) var jkMapping: Bool = true
        
        vimEngine = KindaVimEngine.shared
        vimEngine.toggleHazeOverWindow = toggleHazeOverWindow
        vimEngine.showCharactersTyped = showCharactersTyped
        vimEngine.jkMapping = jkMapping
    }

}
