import SwiftUI
import Preferences
import LaunchAtLogin
import KeyboardShortcuts


struct GeneralPane: View {
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {
            Preferences.Section(title: "") {
                LaunchAtLogin.Toggle()
            }
            
            Preferences.Section(title: "Use custom shortcut") {
                KeyboardShortcuts.Recorder(for: .enterNormalMode)
            }
        }
    }
    
}


struct GeneralPane_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralPane()
    }

}
