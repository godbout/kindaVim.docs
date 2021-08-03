extension KeyboardStrategyNormalMode {
    
    func gg(on role: AXElementRole?) -> [KeyCombination] {
        switch role {
        case .webArea:
            return [KeyCombination(key: .up, command: true)]
        default:
            return [KeyCombination(key: .up, option: true)]
        }
    }
    
}
