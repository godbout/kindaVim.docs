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
                        KindaVimEngine.shared.toggleHazeOverWindow = $0
                    }
                Toggle("Change Menu Bar Icon when not Viming", isOn: $toggleMenuBarIcon)
//                Toggle("Show characters typed", isOn: $showCharactersTyped)
//                    .onChange(of: showCharactersTyped) {
//                        KindaVimEngine.shared.showCharactersTyped = $0
//                    }
            }
        }
        .frame(width: 570, height: 40)
    }
    
}


struct VisualsPane_Previews: PreviewProvider {
    
    static var previews: some View {
        VisualsPane()
    }
}
