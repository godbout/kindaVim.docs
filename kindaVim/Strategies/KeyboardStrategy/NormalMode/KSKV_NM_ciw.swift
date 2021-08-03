extension KeyboardStrategyNormalMode {
    
    func ciw() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .left, option: true, shift: true),
            KeyCombination(key: .delete)
        ]
    }
    
}
