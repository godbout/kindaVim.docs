import SwiftUI
import Sparkle


final class Updater: ObservableObject {
    
    private let updaterController: SPUStandardUpdaterController
    @Published var canCheckForUpdates = true
    
    init() {
        updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)        
        updaterController.updater.publisher(for: \.canCheckForUpdates).assign(to: &$canCheckForUpdates)
    }
    
    func checkForUpdates() {
        updaterController.checkForUpdates(nil)
    }
    
}
