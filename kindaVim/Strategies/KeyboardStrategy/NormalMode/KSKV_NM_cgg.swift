extension KeyboardStrategyNormalMode {
    
    func cgg() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .up, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }
    
}
