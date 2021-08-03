extension KeyboardStrategyNormalMode {
    
    func dG() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .down, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }
    
}
