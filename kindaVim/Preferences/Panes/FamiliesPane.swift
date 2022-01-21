import SwiftUI
import VimEngineState


struct AppDropped: Hashable {
    
    let bundleIdentifier: String
    let name: String
    let icon: NSImage

}


enum SimpleAdvancedTab {
    
    case simple
    case advanced
    
}


struct FamiliesPane: View {

    @AppStorage(SettingsKeys.jkMapping) private var jkMapping: Bool = true
    @AppStorage(SettingsKeys.appsToIgnore) private var appsToIgnore: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforcePGR) private var appsForWhichToEnforcePGR: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceElectron) private var appsForWhichToEnforceElectron: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyMapping) private var appsForWhichToEnforceKeyMapping: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceNineOneOne) private var appsForWhichToEnforceNineOneOne: Set<String> = []

    private var appsToIgnoreSortedByName: [AppDropped] {
        appsSortedByName(appsToIgnore)
    }

    private var appsForWhichToEnforcePGRSortedByName: [AppDropped] {
        appsSortedByName(appsForWhichToEnforcePGR)
    }
        
    private var appsForWhichToEnforceElectronSortedByName: [AppDropped] {
        appsSortedByName(appsForWhichToEnforceElectron)
    }
    
    private var appsForWhichToEnforceKeyMappingSortedByName: [AppDropped] {
        appsSortedByName(appsForWhichToEnforceKeyMapping)
    }
        
    private var appsForWhichToEnforceNineOneOneSortedByName: [AppDropped] {
        appsSortedByName(appsForWhichToEnforceNineOneOne)
    }

    @State private var appsToIgnoreSelection = Set<String>()
    @State private var appsForWhichToEnforcePGRSelection = Set<String>()
    @State private var appsForWhichToEnforceElectronSelection = Set<String>()
    @State private var appsForWhichToEnforceKeyMappingSelection = Set<String>()
    @State private var appsForWhichToEnforceNineOneOneSelection = Set<String>()
    @State private var tab: SimpleAdvancedTab = .simple


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
                Text("by default kV automatically detects whether it can use the macOS Accessibility (best) or needs to remap keys (subpar) in order to achieve a Vim move. that works well for most apps. still, you may need some tweaking for apps with restrictions, or apps that are just pure evil liars. see below.") 
                Spacer()
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(.bottom)
            
            HStack(alignment: .center) {
                Spacer()
                Button("simple") {
                    tab = .simple
                }
                .buttonStyle(.borderless)
                .foregroundColor(tab == .simple ? .primary : .secondary)
                Spacer()
                Button("advanced") {
                    tab = .advanced
                }
                .buttonStyle(.borderless)
                .foregroundColor(tab == .advanced ? .primary : .secondary)
                Spacer()
            }
            
            Divider()
                .padding(.bottom)
           
            HStack {
                if tab == .simple {
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
                        .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appFamily: .off))
                    }
                    
                    
                    VStack(alignment: .center) {
                        Text("PG-R")
                            .font(.title)
                            .padding(.bottom, 10)
                        Text("drop native apps where moving around works but modifying text doesn't. for restricted apps. mostly browsers and some Catalyst ones.")
                            .padding(.leading, 5)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        List(appsForWhichToEnforcePGRSortedByName, id: \.bundleIdentifier, selection: $appsForWhichToEnforcePGRSelection) { app in
                            HStack {
                                Image(nsImage: app.icon)
                                Text(app.name)
                            }
                        }
                        .contextMenu {
                            Button("Delete") {
                                for selection in appsForWhichToEnforcePGRSelection {
                                    appsForWhichToEnforcePGR.remove(selection)
                                }
                            }
                        }
                        .listStyle(.bordered(alternatesRowBackgrounds: true))
                        .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appFamily: .pgR))
                    }
                    

                    VStack(alignment: .center) {
                        Text("Electron")
                            .font(.title)
                            .padding(.bottom, 10)
                        Text("drop apps that handle the macOS Accessibility according to the weather and that are also slow af with it. i.e. all Electron apps.")
                            .padding(.leading, 5)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        List(appsForWhichToEnforceElectronSortedByName, id: \.bundleIdentifier, selection: $appsForWhichToEnforceElectronSelection) { app in
                            HStack {
                                Image(nsImage: app.icon)
                                Text(app.name)
                            }
                        }
                        .contextMenu {
                            Button("Delete") {
                                for selection in appsForWhichToEnforceElectronSelection {
                                    appsForWhichToEnforceElectron.remove(selection)
                                }
                            }
                        }
                        .listStyle(.bordered(alternatesRowBackgrounds: true))
                        .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appFamily: .electron))
                    }
                } else if tab == .advanced {
                    HStack {
                        VStack(alignment: .center) {
                            Text("Key Mapping")
                                .font(.title)
                                .padding(.bottom, 10)
                            Text("drop big fat liar apps that say they implement the macOS Accessibility but actually send you a pile of garbage information. tailor-made for badly-behaved Electron apps.")
                                .padding(.leading, 5)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            List(appsForWhichToEnforceKeyMappingSortedByName, id: \.bundleIdentifier, selection: $appsForWhichToEnforceKeyMappingSelection) { app in
                                HStack {
                                    Image(nsImage: app.icon)
                                    Text(app.name)
                                }
                            }
                            .contextMenu {
                                Button("Delete") {
                                    for selection in appsForWhichToEnforceKeyMappingSelection {
                                        appsForWhichToEnforceKeyMapping.remove(selection)
                                    }
                                }
                            }
                            .listStyle(.bordered(alternatesRowBackgrounds: true))
                            .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appFamily: .keyMapping))
                        }
                        

                        VStack(alignment: .center) {
                            Text("911")
                                .font(.title)
                                .padding(.bottom, 10)
                            Text("drop apps where the developers read the Apple macOS guidelines and decided to do all the opposite and nothing works. e.g. Microsoft Word. last resort to enforce Key Mapping for Text Elements.")
                                .padding(.leading, 5)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            List(appsForWhichToEnforceNineOneOneSortedByName, id: \.bundleIdentifier, selection: $appsForWhichToEnforceNineOneOneSelection) { app in
                                HStack {
                                    Image(nsImage: app.icon)
                                    Text(app.name)
                                }
                            }
                            .contextMenu {
                                Button("Delete") {
                                    for selection in appsForWhichToEnforceNineOneOneSelection {
                                        appsForWhichToEnforceNineOneOne.remove(selection)
                                    }
                                }
                            }
                            .listStyle(.bordered(alternatesRowBackgrounds: true))
                            .onDrop(of: [.fileURL], delegate: AppsDropDelegate(appFamily: .nineOneOne))
                        }
                        
                    }
                }
            }
            .frame(width: nil, height: 300)

            Divider()

            HStack {
                Spacer()

                Toggle("map jk to gj gk for Auto, PG-R and Electron Families", isOn: $jkMapping)
                    .onChange(of: jkMapping) {
                        AppCore.shared.vimEngine.jkMapping = $0
                    }

                Spacer()
            }
            .padding(.top, 12)
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }

}


struct AppsDropDelegate: DropDelegate {

    @AppStorage(SettingsKeys.appsToIgnore) private var appsToIgnore: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforcePGR) private var appsForWhichToEnforcePGR: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceElectron) private var appsForWhichToEnforceElectron: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceKeyMapping) private var appsForWhichToEnforceKeyMapping: Set<String> = []
    @AppStorage(SettingsKeys.appsForWhichToEnforceNineOneOne) private var appsForWhichToEnforceNineOneOne: Set<String> = []

    let appFamily: VimEngineAppFamily


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
                        switch appFamily {
                        case .off:
                            appsToIgnore.insert(bundleIdentifiter)
                        case .pgR:
                            appsForWhichToEnforcePGR.insert(bundleIdentifiter)
                        case .electron:
                            appsForWhichToEnforceElectron.insert(bundleIdentifiter)
                        case .keyMapping:
                            appsForWhichToEnforceKeyMapping.insert(bundleIdentifiter)
                        case .nineOneOne:
                            appsForWhichToEnforceNineOneOne.insert(bundleIdentifiter)
                        case .auto:
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


struct Families_Previews: PreviewProvider {
    
    static var previews: some View {
        FamiliesPane()
    }
}
