protocol KeyboardStrategyVisualModeProtocol {
    
    func d() -> [KeyCombination]
    func gg() -> [KeyCombination]
    func G() -> [KeyCombination]
    func j() -> [KeyCombination]
    func k() -> [KeyCombination]
    func y() -> [KeyCombination]

}


struct KeyboardStrategyVisualMode: KeyboardStrategyVisualModeProtocol {}
