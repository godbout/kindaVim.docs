import SwiftUI
import LaunchAtLogin
import KeyboardShortcuts


struct GeneralPane: View {

    @AppStorage(SettingsKeys.useCustomShortcutToEnterNormalMode) private var useCustomShortcutToEnterNormalMode: Bool = false
    
    var body: some View {
        
        Form {
            VStack(alignment: .leading) {
                LaunchAtLogin.Toggle()
                
                HStack {
                    Toggle("Use custom shortcut to enter Normal Mode:", isOn: $useCustomShortcutToEnterNormalMode)
                    KeyboardShortcuts.Recorder(for: .enterNormalMode).disabled(!useCustomShortcutToEnterNormalMode)
                }
                .padding(.top, 10)
                                
                Text("by default Escape is used to enter Normal Mode. press Escape twice to send Escape to macOS.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }
        
}


struct GeneralPane_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralPane()
    }

}
