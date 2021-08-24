import SwiftUI
import Preferences


struct StrategiesPane: View {
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {
            Preferences.Section(title: "currently harcoded LMAO") {}
        }
    }
    
}


struct StrategiesPane_Previews: PreviewProvider {
    
    static var previews: some View {
        StrategiesPane()
    }
}
