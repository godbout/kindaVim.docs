import Foundation


struct SettingsKeys {
    
    static let useCustomShortcutToEnterNormalMode = "useCustomShortcutToEnterNormalMode"
    
    static let toggleHazeOverWindow = "toggleHazeOverWindow"
    static let toggleMenuBarIcon = "toggleMenuBarIcon"
    static let showCharactersTyped = "showCharactersTyped"
       
    static let appsToIgnore = "appsToIgnore"
    static let appsForWhichToEnforceKeyboardStrategy = "appsForWhichToEnforceKeyboardStrategy"
    
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
