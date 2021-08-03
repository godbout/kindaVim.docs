extension KeyboardStrategyNormalMode {
    
    func yy() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .c, command: true),
            KeyCombination(key: .right)
        ]
    }
    
}
