import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    lazy var appComponent = AppComponent()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        appComponent.setUp()
    }

}

