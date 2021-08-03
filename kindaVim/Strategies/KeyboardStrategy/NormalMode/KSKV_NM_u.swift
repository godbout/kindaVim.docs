extension KeyboardStrategyNormalMode {
    
    // gross undo/redo for now until we understand the UndoManager API
    func u() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true),
            KeyCombination(key: .left),
            KeyCombination(key: .right, shift: true)
        ]
    }
    
}
