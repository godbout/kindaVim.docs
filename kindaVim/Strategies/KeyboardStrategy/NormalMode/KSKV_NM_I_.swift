extension KeyboardStrategyNormalMode {
    
    func I() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }
    
}
