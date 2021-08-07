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
        }
        
        return nil
    }
    
    // currently we return the main screen. i'm not sure yet how to calculate on which screen is a NSWindow
    // seems that checking the bounds will not work, because this is not how macOS shows windows. your window
    // can have more than half on a screen but still show on the other screen. it's not about the bounds, it's
    // about where is the cursor position when you move a window. so, currently no idea how to do this better.
    // need to digest.
    private func screenWhereMainWindowIsWhenNotInFullScreenMode(using mainWindowInfo: MainWindowInfo) -> NSScreen? {
        for screen in NSScreen.screens {
            if mainWindowInfo.x >= screen.frame.origin.x
                && mainWindowInfo.y >= screen.frame.origin.y
                && (mainWindowInfo.x + mainWindowInfo.width) >= (screen.frame.origin.x + screen.frame.width)
                && (mainWindowInfo.y + mainWindowInfo.height) >= (screen.frame.origin.y + screen.frame.height)
            {
                return screen
            }
        }
        
        return NSScreen.main
    }
    
    func mainWindowIsInFullScreenMode() -> Bool {
        return AXEngine.axFullScreenStatus(of: AXEngine.axFocusedElement())
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
