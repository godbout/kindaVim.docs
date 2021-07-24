extension AccessibilityStrategyVisualMode {
    
    func c(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            return theMoveForVisualModeCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.visualStyle == .linewise {
            return theMoveForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func theMoveForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element 
        
        newElement.selectedText = ""
        
        return newElement
    }
    
    private func theMoveForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        if let selectedText = element.selectedText, selectedText.last == "\n" {
            newElement.selectedLength -= AccessibilityTextElement.linefeedCharacterLength
        }
        
        newElement.selectedText = ""
        
        return newElement
    }
    
}
