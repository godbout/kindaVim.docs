import SwiftUI
import Preferences


struct GeneralPane: View {
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {}
    }
    
}


struct GeneralPane_Previews: PreviewProvider {
    
    static var previews: some View {
        GeneralPane()
    }
}
