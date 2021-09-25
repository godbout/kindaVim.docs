import SwiftUI
import Defaults


struct VisualsPane: View {

    @Default(.toggleHazeOverWindow) var toggleHazeOverWindow
    @Default(.showCharactersTyped) var showCharactersTyped

    var body: some View {
        Form {
            Defaults.Toggle("Focus the window that's Viming", key: .toggleHazeOverWindow)
            Defaults.Toggle("Show characters typed", key: .showCharactersTyped)
        }
    }
    
}


struct VisualsPane_Previews: PreviewProvider {
    
    static var previews: some View {
        VisualsPane()
    }
}
