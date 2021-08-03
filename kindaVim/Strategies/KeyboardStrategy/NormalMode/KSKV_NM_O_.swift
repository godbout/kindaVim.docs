extension KeyboardStrategyNormalMode {
    
    func O() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .enter),
            KeyCombination(key: .up)
        ]
    }
    
}
