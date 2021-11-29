import SwiftUI


struct AppDropped: Hashable {
    
    let bundleIdentifier: String
    let name: String
    let icon: NSImage

}


struct ModesPane: View {

    @AppStorage(SettingsKeys.jkMapping) private var jkMapping: Bool = true
    @AppStorage(SettingsKeys.appsToIgnore) private var appsToIgnore: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToUseHybridMode) private var appsForWhichToUseHybridMode: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyboardStrategy) private var appsForWhichToEnforceKeyboardStrategy: Set<String> = []

    private var appsToIgnoreSortedByName: [AppDropped] {
        appsSortedByName(appsToIgnore)
    }

    private var appsForWhichToUseHybridModeSortedByName: [AppDropped] {
        appsSortedByName(appsForWhichToUseHybridMode)
    }
        
    private var appsForWhichToEnforceKeyboardStrategySortedByName: [AppDropped] {
        appsSortedByName(appsForWhichToEnforceKeyboardStrategy)
    }

    @State private var appsToIgnoreSelection = Set<String>()
    @State private var appsForWhichToUseHybridModeSelection = Set<String>()
    @State private var appsForWhichToEnforceKeyboardStrategySelection = Set<String>()


    func appsSortedByName(_ apps: Set<String>) -> [AppDropped] {
        var appsSortedByName: [AppDropped] = []

        for bundleIdentifier in apps {
            if let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundleIdentifier), let appName = try? url.resourceValues(forKeys: [.localizedNameKey]).localizedName {
                appsSortedByName.append(
                    AppDropped(bundleIdentifier: bundleIdentifier, name: appName, icon: NSWorkspace.shared.icon(forFile: url.path))
                )
            }
        }

        appsSortedByName.sort { app1, app2 in
            app1.name.caseInsensitiveCompare(app2.name) == .orderedAscending
        }

        return appsSortedByName
    }


    var body: some View {

        Form {
            HStack {
                Spacer()
                Text("by default kindaVim will automatically do its magic and detect whether to use the macOS Accessibility or to remap keys. that will work well for most apps. still, you may need some tweaking for apps with restrictions, or apps that are just pure evil liars. see below.")
                Spacer()
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(.bottom)
            
            HStack {
                VStack(alignment: .center) {
                    Text("Off")
                        .font(.title)
                        .padding(.bottom, 10)
                    Text("drop apps that you want kindaVim to ignore. useful for apps that have their own Vim mode. e.g. Sublime Text, iTerm2, VSCode.")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    List(appsToIgnoreSortedByName, id: \.bundleIdentifier, selection: $appsToIgnoreSelection) { app in
                        HStack {
                            Image(nsImage: app.icon)
                            Text(app.name)
                        }
                    }
                    .contextMenu {
                        Button("Delete") {
                            for selection in appsToIgnoreSelection {
                                appsToIgnore.remove(selection)
                            }
                        }
                    }
                    .listStyle(.bordered(alternatesRowBackgrounds: true))
                    .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appMode: .off))
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("PG-R")
                        .font(.title)
                        .padding(.bottom, 10)
                    Text("drop apps where moving around works but modifying text doesn't. needed for apps that have security restrictions. mostly browsers.")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    List(appsForWhichToUseHybridModeSortedByName, id: \.bundleIdentifier, selection: $appsForWhichToUseHybridModeSelection) { app in
                        HStack {
                            Image(nsImage: app.icon)
                            Text(app.name)
                        }
                    }
                    .contextMenu {
                        Button("Delete") {
                            for selection in appsForWhichToUseHybridModeSelection {
                                appsForWhichToUseHybridMode.remove(selection)
                            }
                        }
                    }
                    .listStyle(.bordered(alternatesRowBackgrounds: true))
                    .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appMode: .pgR))
                }
                
                Spacer()

                VStack(alignment: .center) {
                    Text("Key Mapping")
                        .font(.title)
                        .padding(.bottom, 10)
                    Text("drop fucking lying apps that say they implement the macOS Accessibility but actually send you back a big pile of rubbish. i.e. all Electron apps.")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    List(appsForWhichToEnforceKeyboardStrategySortedByName, id: \.bundleIdentifier, selection: $appsForWhichToEnforceKeyboardStrategySelection) { app in
                        HStack {
                            Image(nsImage: app.icon)
                            Text(app.name)
                        }
                    }
                    .contextMenu {
                        Button("Delete") {
                            for selection in appsForWhichToEnforceKeyboardStrategySelection {
                                appsForWhichToEnforceKeyboardStrategy.remove(selection)
                            }
                        }
                    }
                    .listStyle(.bordered(alternatesRowBackgrounds: true))
                    .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appMode: .keyMapping))
                }
            }
            .frame(width: nil, height: 300)

            Divider()

            HStack {
                Spacer()

                Toggle("map jk to gj gk for Accessibility Strategy", isOn: $jkMapping)
                    .onChange(of: jkMapping) {
                        AppCore.shared.vimEngine.jkMapping = $0
                    }

                Spacer()
            }
            .padding(.top, 7)
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }

}


struct AppsDropDelegate: DropDelegate {

    @AppStorage(SettingsKeys.appsToIgnore) private var appsToIgnore: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToUseHybridMode) private var appsForWhichToUseHybridMode: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyboardStrategy) private var appsForWhichToEnforceKeyboardStrategy: Set<String> = []

    let appMode: AppMode


    func validateDrop(info: DropInfo) -> Bool {
        guard info.hasItemsConforming(to: [.fileURL]) else { return false }

        let providers = info.itemProviders(for: [.fileURL])
        var result = false

        for provider in providers {
            if provider.canLoadObject(ofClass: URL.self) {
                let group = DispatchGroup()
                group.enter()

                _ = provider.loadObject(ofClass: URL.self) { url, _ in
                    let itemIsAnApplicationBundle = try? url?.resourceValues(forKeys: [.contentTypeKey]).contentType == .applicationBundle
                    result = result || (itemIsAnApplicationBundle ?? false)    
                    group.leave()
                }
                                
                _ = group.wait(timeout: .now() + 0.5)
            }
        }

        return result
    }

    func performDrop(info: DropInfo) -> Bool {
        let providers = info.itemProviders(for: [.fileURL])
        var result = false

        for provider in providers {
            if provider.canLoadObject(ofClass: URL.self) {
                let group = DispatchGroup()
                group.enter()

                _ = provider.loadObject(ofClass: URL.self) { url, _ in
                    let itemIsAnApplicationBundle = (try? url?.resourceValues(forKeys: [.contentTypeKey]).contentType == .applicationBundle) ?? false

                    if itemIsAnApplicationBundle, let url = url, let app = Bundle(url: url), let bundleIdentifiter = app.bundleIdentifier {
                        switch appMode {
                        case .off:
                            appsToIgnore.insert(bundleIdentifiter)
                        case .pgR:
                            appsForWhichToUseHybridMode.insert(bundleIdentifiter)
                        case .keyMapping:
                            appsForWhichToEnforceKeyboardStrategy.insert(bundleIdentifiter)
                        default:
                            ()
                        }

                        result = result || true
                    }
                                        
                    group.leave()
                }

                _ = group.wait(timeout: .now() + 0.5)
            }
        }
        
        return result
    }
    
}


struct ModesPane_Previews: PreviewProvider {
    
    static var previews: some View {
        ModesPane()
    }
}
