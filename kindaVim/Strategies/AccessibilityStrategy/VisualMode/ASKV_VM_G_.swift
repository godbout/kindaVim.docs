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
        var newElement = element
        
        guard let lastLine = AccessibilityTextElementAdaptor.lineFor(location: element.length) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        let firstNonBlankWithinLineLimitOfLastLine = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lastLine.value))
        let newHeadLocation = lastLine.start + firstNonBlankWithinLineLimitOfLastLine
        
        if newHeadLocation >= Self.anchor {
            newElement.caretLocation = Self.anchor
            newElement.selectedLength = (newHeadLocation + element.characterLengthForCharacter(at: newHeadLocation)) - newElement.caretLocation 
        } else {
            newElement.caretLocation = newHeadLocation
            newElement.selectedLength = (Self.anchor + element.characterLengthForCharacter(at: Self.anchor)) - newHeadLocation
        }
        
        newElement.selectedText = nil
        
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

