import SwiftUI


struct StrategiesPane: View {
    
    @AppStorage(SettingsKeys.jkMapping) private var jkMapping: Bool = true
    
    var body: some View {
        
        Form {
            VStack(alignment: .leading) {
                Text("currently hardcoded LMAO")
                
                Toggle("map jk gj gk", isOn: $jkMapping)
                    .onChange(of: jkMapping) { 
                        KindaVimEngine.shared.jkMapping = $0
                    }
            }
            .padding()
            .padding(.horizontal)
        }
        
    }
    
}


struct StrategiesPane_Previews: PreviewProvider {
    
    static var previews: some View {
        StrategiesPane()
    }
}
