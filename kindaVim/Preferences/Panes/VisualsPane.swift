import SwiftUI


struct VisualsPane: View {

    @AppStorage(SettingsKeys.toggleHazeOverWindow) private var toggleHazeOverWindow: Bool = true
    @AppStorage(SettingsKeys.hazeOverWindowFullScreenOpacity) private var hazeOverWindowFullScreenOpacity: Double = 0.2
    @AppStorage(SettingsKeys.hazeOverWindowNonFullScreenOpacity) private var hazeOverWindowNonFullScreenOpacity: Double = 0.8
    @AppStorage(SettingsKeys.toggleMenuBarIcon) private var toggleMenuBarIcon: Bool = false
    @AppStorage(SettingsKeys.showCharactersTyped) private var showCharactersTyped: Bool = false
    
    private static var timer: Timer?
    

    var body: some View {
        
        Form {
            
            VStack(alignment: .leading) {
                Toggle("Highlight the window that is Viming", isOn: $toggleHazeOverWindow)
                    .onChange(of: toggleHazeOverWindow) { 
                        AppCore.shared.vimEngine.toggleHazeOverWindow = $0
                    }
                    .padding(.top, 1)
                HStack {
                    Group {
                        Slider(value: $hazeOverWindowNonFullScreenOpacity, in: 0.0...1) {
                            Text("non fullscreen opacity:")
                        }
                        .help("opacity of the layer that appears below non fullscreen apps")
                        .onChange(of: self.hazeOverWindowNonFullScreenOpacity) { _ in
                            // looks ugly as too. should use Combine?
                            AppCore.shared.vimEngine.display.hazeOver(.on, fullScreenMode: .nonFullScreen)
                                    
                            Self.timer?.invalidate()                                
                            Self.timer = Timer.scheduledTimer(
                                withTimeInterval: 0.28,
                                repeats: false,
                                block: { _ in
                                    AppCore.shared.vimEngine.display.hazeOver(.off)
                                }
                            )
                        }
                        Slider(value: $hazeOverWindowFullScreenOpacity, in: 0.0...0.9) {
                            Text("fullscreen opacity:")
                        }
                        .help("opacity of the layer that appears above fullscreen apps")
                        .onChange(of: hazeOverWindowFullScreenOpacity) { opacity in
                            AppCore.shared.vimEngine.display.hazeOver(.on, fullScreenMode: .fullScreen)
                                    
                            Self.timer?.invalidate()                                
                            Self.timer = Timer.scheduledTimer(
                                withTimeInterval: 0.28,
                                repeats: false,
                                block: { _ in
                                    AppCore.shared.vimEngine.display.hazeOver(.off)
                                }
                            )
                        }
                    }
                    .disabled(!toggleHazeOverWindow)
                }
                .padding(.horizontal)
                Toggle("Change Menu Bar Icon when not Viming", isOn: $toggleMenuBarIcon)
                    .onChange(of: toggleMenuBarIcon) {
                        // ugly af. should need some observer in KVE at least?
                        AppCore.shared.statusBarController.statusItem.button?.image = $0 == true ? NSImage(named: "MenuBarIconEmpty") : NSImage(named: "MenuBarIconFull")
                        AppCore.shared.vimEngine.toggleMenuBarIcon = $0
                    }
                    .padding(.top, 10)
                Toggle("Show characters typed when Viming", isOn: $showCharactersTyped)
                    .onChange(of: showCharactersTyped) {
                        AppCore.shared.vimEngine.showCharactersTyped = $0
                    }
            }
            
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }
    
}


struct VisualsPane_Previews: PreviewProvider {
    
    static var previews: some View {
        VisualsPane()
    }
}
