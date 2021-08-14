extension KeyboardStrategyNormalMode {
    
    func dk(on role: AXElementRole?) -> [KeyCombination] {
        switch role {
        case .scrollArea, .webArea:
            return [
                KeyCombination(key: .right, command: true),
                KeyCombination(key: .left, shift: true, command: true),
                KeyCombination(key: .left, shift: true, command: true),
                KeyCombination(key: .up, shift: true),
                KeyCombination(key: .delete),
                KeyCombination(key: .down),
                KeyCombination(key: .delete)
            ]
        default:
            return [
                KeyCombination(key: .up, shift: true),
                KeyCombination(key: .delete)
            ]
        }
    }
    
}
