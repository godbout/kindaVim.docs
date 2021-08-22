import SwiftUI
import Preferences


struct StrategiesPane: View {
    
    var body: some View {
        Preferences.Container(contentWidth: 450.0) {}
    }
    
}


struct StrategiesPane_Previews: PreviewProvider {
    
    static var previews: some View {
        StrategiesPane()
    }
}
