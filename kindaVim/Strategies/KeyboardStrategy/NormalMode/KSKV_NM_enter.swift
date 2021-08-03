extension KeyboardStrategyNormalMode {
    
    // temporary for pressing enter in Command Mode
    // to act like an enter in Insert Mode
    // checking if it feels better (like in Alfred)
    func enter() -> [KeyCombination] {
        return [
            KeyCombination(key: .enter)
        ]
    }
    
}
