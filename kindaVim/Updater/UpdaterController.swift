import SwiftUI
import Sparkle


final class UpdaterController: ObservableObject {
    
    private let sparkleUpdaterController: SPUStandardUpdaterController
    @Published var canCheckForUpdates = true
    
    init() {
        sparkleUpdaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)        
        sparkleUpdaterController.updater.publisher(for: \.canCheckForUpdates).assign(to: &$canCheckForUpdates)
    }
    
    
    func checkForUpdates() {
        sparkleUpdaterController.checkForUpdates(nil)
    }
    
}
