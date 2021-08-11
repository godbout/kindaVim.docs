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
        
        guard let firstLine = AccessibilityTextElementAdaptor.lineFor(location: 0) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        let firstNonBlankWithinLineLimitOfFirstLine = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: firstLine.value))
        let newHeadLocation = firstLine.start + firstNonBlankWithinLineLimitOfFirstLine
        
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
    
    private func ggForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement             
        }
        
        newElement.caretLocation = 0
        newElement.selectedLength = lineAtAnchor.end
        newElement.selectedText = nil
        
        return newElement
    }
    
}

