extension KeyboardStrategyNormalMode {
    
    func o() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .enter)
        ]
    }
    
}
