import SwiftUI
import Preferences
import LaunchAtLogin
import KeyboardShortcuts
import Defaults


struct GeneralPane: View {

    @Default(.useCustomShortcutToEnterNormalMode) var useCustomShortcutToEnterNormalMode
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {
            Preferences.Section(title: "") {
                LaunchAtLogin.Toggle()
            }
            
            Preferences.Section(title: "") {
                HStack {
                    Toggle("Use custom shortcut to enter Normal Mode:", isOn: $useCustomShortcutToEnterNormalMode)
                    KeyboardShortcuts.Recorder(for: .enterNormalMode).disabled(!useCustomShortcutToEnterNormalMode)
                }
            }
        }
    }
    
}


struct GeneralPane_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralPane()
    }

}
