import SwiftUI


struct StrategiesPane: View {
    
    @AppStorage(SettingsKeys.jkMapping) private var jkMapping: Bool = true
    @AppStorage(SettingsKeys.appsToIgnore) private var appsToIgnore: [String] = [
        "com.sublimetext.4",
        "com.googlecode.iterm2",
        "com.microsoft.VSCode",
        "com.jetbrains.PhpStorm",
        "com.github.atom"
    ]
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyboardStrategy) private var appsForWhichToEnforceKeyboardStrategy: [String] = [
        "com.apple.Safari"
    ]

    @State private var selection = Set<String>()
    
    var body: some View {
        
        Form {
            HStack {
                VStack(alignment: .leading) {
                    Text("drop below the apps that you want kV to ignore:")
                        .padding(.bottom, 1)
                    Text("useful for apps that already have a Vim mode like Sublime Text, iTerm2, etc.")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    List(appsToIgnore, id: \.self, selection: $selection) {
                        Text($0)
                    }
                    .listStyle(.bordered(alternatesRowBackgrounds: true))
                }

                Spacer()

                VStack(alignment: .leading) {
                    Text("drop below the apps for which you want kV to enforce the Keyboard Strategy:")
                        .padding(.bottom, 1)
                    Text("currently useful for fake shit pretending apps like all Electron apps, and restricted apps like browsers.")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    List(appsForWhichToEnforceKeyboardStrategy, id: \.self) {
                        Text($0)
                    }
                    .listStyle(.bordered)
                }
            }

            Divider()
                
            HStack {
                Spacer()

                Toggle("map jk to gj gk for Accessibility Strategy", isOn: $jkMapping)
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
