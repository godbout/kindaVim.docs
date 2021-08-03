extension KeyboardStrategyNormalMode {
    
    func C() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }
    
}
