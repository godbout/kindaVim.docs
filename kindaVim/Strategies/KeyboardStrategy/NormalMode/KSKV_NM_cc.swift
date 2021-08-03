extension KeyboardStrategyNormalMode {
    
    func cc() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }
    
}
