import SwiftUI
import Preferences


struct StrategiesPane: View {
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {
            Preferences.Section(title: "section 1") {
                Text("some bs 1")
                Text("some bs 3")
            }
            
            Preferences.Section(title: "section 2") {
                Text("some bs 2")
                Text("some bs 2")
                Text("some bs 2")
                Text("some bs 2")
            }
        }
    }
    
}


struct StrategiesPane_Previews: PreviewProvider {
    
    static var previews: some View {
        StrategiesPane()
    }
}
