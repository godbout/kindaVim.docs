extension KeyboardStrategyNormalMode {
    
    func w() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .left, option: true)
        ]
    }
    
}
