extension KeyboardStrategyNormalMode {
    
    func dj() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .down, shift: true),
            KeyCombination(key: .down, shift: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }
    
}
