extension KeyboardStrategyNormalMode {
    
    func r(with replacement: KeyCombination) -> [KeyCombination] {
        return [
            KeyCombination(key: .d, control: true),
            replacement,
            KeyCombination(key: .left)
            
        ]
    }
    
}
