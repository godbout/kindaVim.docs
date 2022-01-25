import SwiftUI


struct SettingsView: View {

    var body: some View {
        TabView {
            GeneralPane()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
            FamiliesPane()
                .tabItem {
                    Label("Families", systemImage: "keyboard")
                }
            VisualsPane()
                .tabItem {
                    Label("Visuals", systemImage: "eyeglasses")
                }
            LicensePane()
                .tabItem {
                    Label("License", systemImage: "alarm")
                }
            #if DEBUG
            PaddleTestingPane() 
                .tabItem {
                    Label("Paddle Testing", systemImage: "testtube.2")
                    
                }
            #endif
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
