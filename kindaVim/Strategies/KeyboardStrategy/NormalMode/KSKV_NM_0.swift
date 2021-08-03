extension KeyboardStrategyNormalMode {
    
    func zero() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }
    
}
