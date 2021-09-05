import SwiftUI
import Preferences
import Defaults


struct VisualsPane: View {

    @Default(.toggleHazeOverWindow) var toggleHazeOverWindow
    @Default(.showCharactersTyped) var showCharactersTyped

    var body: some View {
        Preferences.Container(contentWidth: 450.0) {
            Preferences.Section(title: "") {
                if #available(macOS 11, *) {
                    Defaults.Toggle("Focus the window that's Viming", key: .toggleHazeOverWindow)
                    Defaults.Toggle("Show characters typed", key: .showCharactersTyped)
                } else {
                    Toggle("Focus the window that's Viming", isOn: $toggleHazeOverWindow)
                    Toggle("Show characters typed", isOn: $showCharactersTyped)
                }
            }
        }
    }
    
}


struct VisualsPane_Previews: PreviewProvider {
    
    static var previews: some View {
        VisualsPane()
    }
}
