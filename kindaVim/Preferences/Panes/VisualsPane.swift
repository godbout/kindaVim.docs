import SwiftUI


struct VisualsPane: View {

    @AppStorage(SettingsKeys.toggleHazeOverWindow) private var toggleHazeOverWindow: Bool = true
    @AppStorage(SettingsKeys.showCharactersTyped) private var showCharactersTyped: Bool = false

    var body: some View {
        
        Form {
            VStack(alignment: .leading) {
                Toggle("Focus the window that's Viming", isOn: $toggleHazeOverWindow)
                    .onChange(of: toggleHazeOverWindow) { 
                        KindaVimEngine.shared.toggleHazeOverWindow = $0
                    }
                Toggle("Show characters typed", isOn: $showCharactersTyped)
                    .onChange(of: showCharactersTyped) {
                        KindaVimEngine.shared.showCharactersTyped = $0
                    }
            }
            .padding()
            .padding(.horizontal)
        }
            
    }
    
}


struct VisualsPane_Previews: PreviewProvider {
    
    static var previews: some View {
        VisualsPane()
    }
}
