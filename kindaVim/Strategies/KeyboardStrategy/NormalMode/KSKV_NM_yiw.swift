extension KeyboardStrategyNormalMode {
    
    func yiw() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, option: true),
            KeyCombination(key: .right, option: true, shift: true),
            KeyCombination(key: .c, command: true),
            KeyCombination(key: .right)
        ]
    }
    
}
