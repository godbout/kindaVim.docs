import SwiftUI
import Preferences
import LaunchAtLogin


struct GeneralPane: View {
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {
            Preferences.Section(title: "") {
                LaunchAtLogin.Toggle()
            }
        }
    }
    
}


struct GeneralPane_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralPane()
    }
}
