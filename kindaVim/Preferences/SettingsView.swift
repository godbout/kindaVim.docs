import SwiftUI


struct SettingsView: View {

    var body: some View {
        TabView {
            GeneralPane()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
            StrategiesPane()
                .tabItem {
                    Label("Strategies", systemImage: "keyboard")
                }
            VisualsPane()
                .tabItem {
                    Label("Visuals", systemImage: "eyeglasses")
                }
        }
        .frame(width: 500, height: 150, alignment: .leading)
        .padding(.horizontal, 20)
    }
    
}


struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView()
    }
    
}
