extension KeyboardStrategyNormalMode {
    
    func caret() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .left, option: true),
        ]
    }
    
}
