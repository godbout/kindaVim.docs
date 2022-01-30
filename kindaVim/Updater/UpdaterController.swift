import SwiftUI
import Sparkle


final class UpdaterController: ObservableObject {
    
    private let updaterController: SPUStandardUpdaterController
    @Published var canCheckForUpdates = true
    
    var automaticallyChecksForUpdates: Bool {
        get {
            updaterController.updater.automaticallyChecksForUpdates
        }
        set {
            updaterController.updater.automaticallyChecksForUpdates = newValue
        }
    }
    
    init() {
        updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)        
        updaterController.updater.publisher(for: \.canCheckForUpdates).assign(to: &$canCheckForUpdates)
    }
    
    func checkForUpdates() {
        updaterController.checkForUpdates(nil)
    }
    
}
