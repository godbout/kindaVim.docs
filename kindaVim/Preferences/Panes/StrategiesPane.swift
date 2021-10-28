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
                Spacer()
            }
            .padding(.top, 15)
            .padding(.bottom, 10)
        }
        .frame(width: 570, height: 300)
    }
    
}


struct StrategiesPane_Previews: PreviewProvider {
    
    static var previews: some View {
        StrategiesPane()
    }
}
