extension AccessibilityStrategyVisualMode {
    
    func c(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if VimEngine.shared.visualStyle == .characterwise {
            return theMoveForVisualModeCharacterwise(on: element)
        }
        
        if VimEngine.shared.visualStyle == .linewise {
            return theMoveForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func theMoveForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element 
        
        element.selectedText = ""
        
        return element
    }
    
    private func theMoveForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let selectedText = element.selectedText, selectedText.last == "\n" {
            element.selectedLength -= 1
        }
        
        element.selectedText = ""
        
        return element
    }
    
}
