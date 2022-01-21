import AppKit


class InputFieldObserver {

    var axObserver: AXObserver?
    var axApplicationElement: AXUIElement?
    
    
    func startObserving() {
        guard let pid = AppCore.shared.axEngine.axFrontmostApplicationPID() else { return }
        
        if AXObserverCreate(pid, { _, _, _, _ in
            AppCore.shared.vimEngine.enterInsertMode()
        }, &axObserver) == .success {
            axApplicationElement = AXUIElementCreateApplication(pid)
            
            if AXObserverAddNotification(axObserver!, axApplicationElement!, kAXFocusedWindowChangedNotification as CFString, nil) == .success {
                CFRunLoopAddSource(CFRunLoopGetCurrent(), AXObserverGetRunLoopSource(axObserver!), .commonModes)
            }
        }
    }
    
    func stopObserving() {
        guard let observer = axObserver, let applicationElement = axApplicationElement else { return }
              
        if AXObserverRemoveNotification(observer, applicationElement, kAXFocusedWindowChangedNotification as CFString) == .success {
            CFRunLoopRemoveSource(CFRunLoopGetCurrent(), AXObserverGetRunLoopSource(observer), .commonModes)
        }
    }
    
}
