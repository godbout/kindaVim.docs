import SwiftUI


struct SettingsView: View {

    var body: some View {
        TabView {
            GeneralPane()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
            ModesPane()
                .tabItem {
                    Label("Modes", systemImage: "keyboard")
                }
            VisualsPane()
                .tabItem {
                    Label("Visuals", systemImage: "eyeglasses")
                }
        }
        .padding()
        .padding(.horizontal)
    }
    
}


struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView()
    }
    
}
