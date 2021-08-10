extension KeyboardStrategyNormalMode {
    
    func G(on role: AXElementRole?) -> [KeyCombination] {
        switch role {
        case .webArea:
            return [
                KeyCombination(key: .down, command: true),
                KeyCombination(key: .left, command: true),
            ]
        default:
            return [KeyCombination(key: .down, option: true)]
        }
    }
    
}
