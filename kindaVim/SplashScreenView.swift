import SwiftUI


struct VisualEffectView: NSViewRepresentable {

    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.state = .active
        visualEffectView.material = .menu

        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }

}


struct SplashScreenView: View {
        
    var body: some View {
        Form {
            VStack {
                HStack(alignment: .top) {
                    Image(nsImage: NSImage(named: "AppIcon")!)
                    VStack(alignment: .leading) {
                        Text("blah blah blah you know the drill.")
                            .font(.headline)
                            .padding(.top)
                        Text("once you've granted Accessibility Privileges you can enter Normal Mode with Escape, or set your own Keyboard Shorcut in the Preferences.")
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 10)
                    }
                }
                .padding(.bottom, 6)
                Spacer()
                Divider()
                    .padding(.bottom, 6)
                HStack {
                    Button("Quit kindaVim") {
                        NSApp.terminate(self)
                    }
                    Spacer()
                    Button("Grant Accessibility Privileges") {
                        showAccessibilityPrivilegesPrompt()
                    }
                }        
            }
        }
        .frame(width: 468, height: 169, alignment: .center)
        .padding()
        .background(VisualEffectView(material: .menu, blendingMode: .behindWindow))
        .cornerRadius(15.0)
    }
    
    func showAccessibilityPrivilegesPrompt() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        
        AXIsProcessTrustedWithOptions(options)
    }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
