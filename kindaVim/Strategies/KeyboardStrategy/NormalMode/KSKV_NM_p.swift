extension KeyboardStrategyNormalMode {
    
    func p() -> [KeyCombination] {
        return [
            KeyCombination(key: .right),
            KeyCombination(key: .v, command: true),
        ]
    }
    
}
