import AppKit


protocol WindowProtocol {
    
    func screenWhereMainWindowIs(using mainWindowInfo: MainWindowInfo) -> NSScreen?
    func mainWindowIsInFullScreenMode() -> Bool
    func mainWindowInfo() -> MainWindowInfo?

}


extension WindowProtocol {

    func screenWhereMainWindowIs(using mainWindowInfo: MainWindowInfo) -> NSScreen? {
        // the calculation is different for when in fullScreen and when not
        // because the mac APIs are bonkers
        if mainWindowIsInFullScreenMode() {
            return screenWhereMainWindowIsWhenInFullScreenMode(using: mainWindowInfo) 
        } else {
            return screenWhereMainWindowIsWhenNotInFullScreenMode(using: mainWindowInfo)
        }
    }
    
    func mainWindowIsInFullScreenMode() -> Bool {
        return AXEngine.axFullScreenStatus(of: AXEngine.axFocusedElement())
    }
    
    // yes, this is complete madness LMAO
    // first the list of windows should be from front to back but it doesn't work properly
    // in fullScreen mode (there should be only one window but there's two, and the first
    // one that should be the front one is a small window of 54px height. no idea wtf is this)
    // second the y is not correct LMAO as it's UNDER the fucking screen. it seems that in
    // fullScreen mode, the fullScreen window is made of two windows. anyways it completely doesn't
    // follow the docs.
    // so because we can't use y, but because we know we are in the fullScreen mode, we can
    // check which on which screen the window is on by checking the screen and the window
    // start at the same x point :D
    private func screenWhereMainWindowIsWhenInFullScreenMode(using mainWindowInfo: MainWindowInfo) -> NSScreen? {
        for screen in NSScreen.screens {
            if mainWindowInfo.x == screen.frame.origin.x {
                return screen
            }
        }
        
        return nil
    }
    
    // if the window bounds are fully within the screen bounds, then we return that screen
    // but else, if it's in between, then we use the main screen. there might be some cases
    // that go through but fuck it. impossible to solve for every case.d
    private func screenWhereMainWindowIsWhenNotInFullScreenMode(using mainWindowInfo: MainWindowInfo) -> NSScreen? {
        for screen in NSScreen.screens {
            if windowIsFullyWithinScreen(with: mainWindowInfo, for: screen) {
                return screen
            }
        }
        
        return NSScreen.main
    }
    
    private func windowIsFullyWithinScreen(with window: MainWindowInfo, for screen: NSScreen) -> Bool {
        if window.x >= screen.frame.origin.x
            && window.y >= screen.frame.origin.y
            && (window.x + window.width) <= (screen.frame.origin.x + screen.frame.width)
            && (window.y + window.height) <= (screen.frame.origin.y + screen.frame.height)
        {
            return true
        }
        
        return false
    }

    func mainWindowInfo() -> MainWindowInfo? {
        guard let pid = NSWorkspace.shared.frontmostApplication?.processIdentifier else { return nil }
        guard let tooManyWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as NSArray? else { return nil }
        guard let mainWindowData = tooManyWindows.filtered(using: NSPredicate(format: "kCGWindowOwnerPID = \(pid)")).first as? NSDictionary else { return nil }
        
        guard let number = mainWindowData.value(forKey: "kCGWindowNumber") as? Int else { return nil }
        guard let bounds = mainWindowData.value(forKey: "kCGWindowBounds") as? NSDictionary else { return nil }
        guard let height = bounds.value(forKey: "Height") as? CGFloat else { return nil }
        guard let width = bounds.value(forKey: "Width") as? CGFloat else { return nil }
        guard let x = bounds.value(forKey: "X") as? CGFloat else { return nil }
        guard let y = bounds.value(forKey: "Y") as? CGFloat else { return nil }
        
        return MainWindowInfo(
            number: number,
            height: height,
            width: width,
            x: x,
            y: y
        )
    }
    
}
