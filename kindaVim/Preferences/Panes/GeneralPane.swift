import SwiftUI
import Preferences
import LaunchAtLogin
import KeyboardShortcuts
import Defaults


struct GeneralPane: View {

    @Default(.useCustomShortcutToEnterNormalMode) var useCustomShortcutToEnterNormalMode
    
    var body: some View {
        
        Form {
            VStack(alignment: .leading) {
                LaunchAtLogin.Toggle()
                
                HStack {
                    Toggle("Use custom shortcut to enter Normal Mode:", isOn: $useCustomShortcutToEnterNormalMode)
                    KeyboardShortcuts.Recorder(for: .enterNormalMode).disabled(!useCustomShortcutToEnterNormalMode)
                }
                .padding(.top)
                                
                Text("by default Escape is used to enter Normal Mode.").preferenceDescription()
                    .padding(.horizontal)
            }
            .padding()
            .padding(.horizontal)
        }
            
    }
}


struct GeneralPane_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralPane()
    }

}
