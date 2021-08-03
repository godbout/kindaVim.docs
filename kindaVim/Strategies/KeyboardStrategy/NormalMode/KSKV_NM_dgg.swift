extension KeyboardStrategyNormalMode {
    
    func dgg() -> [KeyCombination] {
        return [
            KeyCombination(key: .down),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .up, shift: true, command: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }
    
}
