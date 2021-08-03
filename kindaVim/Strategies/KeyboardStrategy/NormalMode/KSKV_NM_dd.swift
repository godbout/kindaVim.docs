extension KeyboardStrategyNormalMode {
    
    func dd() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .down),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }
    
}
