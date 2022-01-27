import SwiftUI


@main
struct kindaVimApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        // dumb but seems necessary to enable
        // copy paste in Preferences...
        WindowGroup {
            ZStack {
                EmptyView()
                    .hidden()
            }
            .hidden()
        }
        Settings {
            SettingsView()
        }
    }
    
}
