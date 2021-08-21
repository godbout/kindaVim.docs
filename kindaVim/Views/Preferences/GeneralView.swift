import SwiftUI
import Preferences


struct GeneralPane: View {
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {
            Preferences.Section(title: "section 1") {
                Text("some bs 1")
            }
            
            Preferences.Section(title: "section 2") {
                Text("some bs 2")
            }
        }
    }
    
}


struct GeneralPane_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralPane()
    }
}
