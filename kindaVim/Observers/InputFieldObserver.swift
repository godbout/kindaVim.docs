import AppKit


class InputFieldObserver {

    var axObserver: AXObserver?
    var axApplicationElement: AXUIElement?
    
    
    func startObserving() {
        guard let pid = NSWorkspace.shared.frontmostApplication?.processIdentifier else { return }
        
        if AXObserverCreate(pid, { _, _, _, _ in
            print("input field changed detected")
            AppCore.shared.vimEngine.enterInsertMode()
        }, &axObserver) == .success {
            axApplicationElement = AXUIElementCreateApplication(pid)
            
            if AXObserverAddNotification(axObserver!, axApplicationElement!, kAXFocusedUIElementChangedNotification as CFString, nil) == .success {
                print("notification added to run loop")
                CFRunLoopAddSource(CFRunLoopGetCurrent(), AXObserverGetRunLoopSource(axObserver!), .commonModes)
            }
        }
    }
    
    func stopObserving() {
        guard let observer = axObserver, let applicationElement = axApplicationElement else { return }
              
        if AXObserverRemoveNotification(observer, applicationElement, kAXFocusedUIElementChangedNotification as CFString) == .success {
            print("notification removed from run loop")
            CFRunLoopRemoveSource(CFRunLoopGetCurrent(), AXObserverGetRunLoopSource(observer), .commonModes)
        }
    }
    
}
