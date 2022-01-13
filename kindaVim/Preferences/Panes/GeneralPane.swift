import SwiftUI
import LaunchAtLogin
import KeyboardShortcuts


struct GeneralPane: View {

    @AppStorage(SettingsKeys.useCustomShortcutToEnterNormalMode) private var useCustomShortcutToEnterNormalMode: Bool = false
    @AppStorage(SettingsKeys.enableKillSwitch) private var enableKillSwitch: Bool = false
    
    var body: some View {
        
        Form {
            VStack(alignment: .leading) {
                LaunchAtLogin.Toggle()
                    .padding(.bottom, 15)
                // LOL
                Divider()
                    .opacity(0)
                
                HStack(alignment: .center) {
                    Toggle("Enter Normal Mode with custom shortcut:", isOn: $useCustomShortcutToEnterNormalMode)
                    KeyboardShortcuts.Recorder(for: .enterNormalMode).disabled(!useCustomShortcutToEnterNormalMode)
                }
                .padding(.top, 23)
                Group {
                    Text("by default `esc` is used to enter Normal Mode. press `esc` again to send `esc` back to macOS.")
                    Text("e.g. in Insert Mode a Dialog shows up, double `esc` to discard it.")
                }
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                HStack(alignment: .center) {
                    Toggle("Activate Kill Switch with:", isOn: $enableKillSwitch)
                    KeyboardShortcuts.Recorder(for: .killSwitch).disabled(!enableKillSwitch)
                }
                Group {
                    Text("Kill Switch sends you back to Insert Mode from any other Mode while leaving the selection intact.")
                    Text("useful if you want act on the selected text through macOS Services, third party apps, etc...")
                }
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
