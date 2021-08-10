extension AccessibilityStrategyVisualMode {
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            return ggForVisualModeCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.visualStyle == .linewise {
            return ggForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func ggForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        return newElement        
    }
    
    private func ggForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        return newElement
    }
    
}

