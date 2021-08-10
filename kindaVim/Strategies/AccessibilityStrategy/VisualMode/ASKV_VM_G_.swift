extension AccessibilityStrategyVisualMode {
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            return GForVisualModeCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.visualStyle == .linewise {
            return GForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func GForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        let newElement = element
        
        return newElement
    }
        
    private func GForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement             
        }
        
        newElement.caretLocation = lineAtAnchor.start
        newElement.selectedLength = element.length - newElement.caretLocation
        newElement.selectedText = nil
        
        return newElement
    }
    
}

