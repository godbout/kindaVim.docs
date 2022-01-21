import Foundation


struct SettingsKeys {
    
    static let useCustomShortcutToEnterNormalMode = "useCustomShortcutToEnterNormalMode"
    static let enableKillSwitch = "enableKillSwitch"
    
    static let toggleHazeOverWindow = "toggleHazeOverWindow"
    static let hazeOverWindowFullScreenOpacity = "hazeOverWindowFullScreenOpacity"
    static let hazeOverWindowNonFullScreenOpacity = "hazeOverWindowNonFullScreenOpacity"
    static let toggleMenuBarIcon = "toggleMenuBarIcon"
    static let showCharactersTyped = "showCharactersTyped"
       
    static let appsToIgnore = "appsToIgnore"
    static let appsForWhichToEnforcePGR = "appsForWhichToUseHybridMode"
    static let appsForWhichToEnforceElectron = "appsForWhichToEnforceElectron"
    static let appsForWhichToEnforceKeyMapping = "appsForWhichToEnforceKeyboardStrategy"
    static let appsForWhichToEnforceNineOneOne = "appsForWhichToEnforceNineOneOne"
    
    static let jkMapping = "jkMapping"
    
}


// needed for AppStorage to save Sets
extension Set: RawRepresentable where Element: Codable {

    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else { return nil }
        guard let result = try? JSONDecoder().decode(Set<Element>.self, from: data) else { return nil}
        
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self) else { return "[]" }
        guard let result = String(data: data, encoding: .utf8) else { return "[]" }
        
        return result
    }
    
}
