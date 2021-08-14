extension KeyboardStrategyNormalMode {
    
    func dj(on role: AXElementRole?) -> [KeyCombination] {
        switch role {
        case .webArea:
            return [
                KeyCombination(key: .left, command: true),
                KeyCombination(key: .left, command: true),
                KeyCombination(key: .down, shift: true),
                KeyCombination(key: .down, shift: true),
                KeyCombination(key: .delete),
                KeyCombination(key: .right, command: true),
                KeyCombination(key: .left, command: true)
            ]
        default:
            return [
                KeyCombination(key: .down, shift: true),
                KeyCombination(key: .delete)
            ]
        }
    }
    
}
