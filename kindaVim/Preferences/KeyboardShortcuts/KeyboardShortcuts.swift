import KeyboardShortcuts


extension KeyboardShortcuts.Name {
    
    static let enterNormalMode = Self("enterNormalMode", default: .init(.leftBracket, modifiers: [.control]))
    static let killSwitch = Self("killSwitch", default: .init(.j, modifiers: [.control, .option, .command]))
    
}
