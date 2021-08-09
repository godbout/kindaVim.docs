protocol KeyboardStrategyVisualModeProtocol {
    
    func d() -> [KeyCombination]
    func j() -> [KeyCombination]
    func k() -> [KeyCombination]

}


struct KeyboardStrategyVisualMode: KeyboardStrategyVisualModeProtocol {}
