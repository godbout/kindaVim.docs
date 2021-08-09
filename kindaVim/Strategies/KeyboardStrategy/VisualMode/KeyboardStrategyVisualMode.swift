protocol KeyboardStrategyVisualModeProtocol {
    
    func d() -> [KeyCombination]
    func G() -> [KeyCombination]
    func j() -> [KeyCombination]
    func k() -> [KeyCombination]
    func y() -> [KeyCombination]

}


struct KeyboardStrategyVisualMode: KeyboardStrategyVisualModeProtocol {}
