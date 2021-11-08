import SwiftUI


struct VisualsPane: View {

    @AppStorage(SettingsKeys.toggleHazeOverWindow) private var toggleHazeOverWindow: Bool = true
    @AppStorage(SettingsKeys.toggleMenuBarIcon) private var toggleMenuBarIcon: Bool = false
    @AppStorage(SettingsKeys.showCharactersTyped) private var showCharactersTyped: Bool = false

    var body: some View {
        
        Form {
            VStack(alignment: .leading) {
                Toggle("Highlight the window that is Viming", isOn: $toggleHazeOverWindow)
                    .onChange(of: toggleHazeOverWindow) { 
                        AppCore.shared.vimEngine.toggleHazeOverWindow = $0
                    }
                Toggle("Change Menu Bar Icon when not Viming", isOn: $toggleMenuBarIcon)
                    .onChange(of: toggleMenuBarIcon) {
                        // ugly af. should need some observer in KVE at least?
                        AppCore.shared.statusBarController.statusItem.button?.image = $0 == true ? NSImage(named: "MenuBarIconEmpty") : NSImage(named: "MenuBarIconFull")
                        AppCore.shared.vimEngine.toggleMenuBarIcon = $0
                    }
                #if DEBUG
                Toggle("Show characters typed when Viming", isOn: $showCharactersTyped)
                    .onChange(of: showCharactersTyped) {
                        AppCore.shared.vimEngine.showCharactersTyped = $0
                    }
                #endif
            }
        }
        .frame(width: 570, height: nil)
    }
    
}


struct VisualsPane_Previews: PreviewProvider {
    
    static var previews: some View {
        VisualsPane()
    }
}
