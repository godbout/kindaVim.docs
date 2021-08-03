extension KeyboardStrategyNormalMode {
    
    func underscore() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }
    
}
