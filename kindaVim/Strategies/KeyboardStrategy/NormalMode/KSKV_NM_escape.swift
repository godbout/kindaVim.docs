extension KeyboardStrategyNormalMode {
    
    // temporary for escape to enter Command Mode
    // and escape again to send escape key to macOS
    func escape() -> [KeyCombination] {
        return [
            KeyCombination(key: .escape)
        ]
    }
    
}
