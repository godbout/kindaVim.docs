import SwiftUI


struct AppDropped: Hashable {
    
    let bundleIdentifier: String
    let name: String
    
}


struct StrategiesPane: View {
    
    @AppStorage(SettingsKeys.jkMapping) private var jkMapping: Bool = true
    @AppStorage(SettingsKeys.appsToIgnore) private var appsToIgnore: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyboardStrategy) private var appsForWhichToEnforceKeyboardStrategy: Set<String> = []
    
    @State private var appsToIgnoreSelection = Set<String>()
    @State private var appsForWhichToEnforceKeyboardStrategySelection = Set<String>()
    
    func appsSortedByName(_ apps: Set<String>) -> [AppDropped] {
        var appsSortedByName: [AppDropped] = []
        
        for bundleIdentifier in apps {
            if let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundleIdentifier), let appName = try? url.resourceValues(forKeys: [.localizedNameKey]).localizedName {
                appsSortedByName.append(AppDropped(bundleIdentifier: bundleIdentifier, name: appName))
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
                VStack(alignment: .leading) {
                    Text("drop below the apps that you want kV to ignore:")
                        .padding(.bottom, 1)
                    Text("useful for apps that already have a Vim mode like Sublime Text, iTerm2, etc.")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    List(appsSortedByName(appsToIgnore), id: \.bundleIdentifier, selection: $appsToIgnoreSelection) { app in
                        if let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: app.bundleIdentifier) {
                            HStack {
                                Image(nsImage: NSWorkspace.shared.icon(forFile: url.path))
                                Text(app.name)
                            }
                        } else {
                            Text(app.bundleIdentifier)
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
                    .onDrop(of: [.fileURL], delegate: AppsDropDelegate(strategy: .ignore))
               }

                Spacer()

                VStack(alignment: .leading) {
                    Text("drop below the apps for which you want kV to enforce the Keyboard Strategy:")
                        .padding(.bottom, 1)
                    Text("currently useful for fake shit pretending apps like all Electron apps, and restricted apps like browsers.")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    List(appsSortedByName(appsForWhichToEnforceKeyboardStrategy), id: \.bundleIdentifier, selection: $appsForWhichToEnforceKeyboardStrategySelection) { app in
                        if let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: app.bundleIdentifier) {
                            HStack {
                                Image(nsImage: NSWorkspace.shared.icon(forFile: url.path))
                                Text(app.name)
                            }
                        } else {
                            Text(app.bundleIdentifier)
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
                    .onDrop(of: [.fileURL], delegate: AppsDropDelegate(strategy: .enforceKeyboardStrategy))
                }
            }
            .frame(width: nil, height: 250)

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
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyboardStrategy) private var appsForWhichToEnforceKeyboardStrategy: Set<String> = []
    
    enum AppStrategy {
        case ignore
        case enforceKeyboardStrategy
    }
    
    let strategy: AppStrategy
    
    
    func validateDrop(info: DropInfo) -> Bool {
        guard info.hasItemsConforming(to: [.fileURL]) else { return false }
        
        let providers = info.itemProviders(for: [.fileURL])
        var result = false
                
        for provider in providers {
            if provider.canLoadObject(ofClass: URL.self) {
                let group = DispatchGroup()
                group.enter()
                
                _ = provider.loadObject(ofClass: URL.self) { url, _ in
                    defer { group.leave() }
                    let itemIsAnApplicationBundle = try? url?.resourceValues(forKeys: [.contentTypeKey]).contentType == .applicationBundle
                    result = result || (itemIsAnApplicationBundle ?? false)
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
                    defer { group.leave() }
                    let itemIsAnApplicationBundle = (try? url?.resourceValues(forKeys: [.contentTypeKey]).contentType == .applicationBundle) ?? false
                    
                    if itemIsAnApplicationBundle, let url = url, let app = Bundle(url: url), let bundleIdentifiter = app.bundleIdentifier {
                        switch strategy {
                        case .ignore:
                            appsToIgnore.insert(bundleIdentifiter)
                        case .enforceKeyboardStrategy:
                            appsForWhichToEnforceKeyboardStrategy.insert(bundleIdentifiter)
                        }
                                                
                        result = true
                    }
                }
                                
                _ = group.wait(timeout: .now() + 0.5)
            }
        }
        
        return result
    }
    
}


struct StrategiesPane_Previews: PreviewProvider {
    
    static var previews: some View {
        StrategiesPane()
    }
}
