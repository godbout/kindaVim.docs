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
    }
    
}


struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView()
    }
    
}
