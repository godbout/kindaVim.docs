extension AccessibilityStrategyVisualMode {
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        
        if element.isEmpty {
            Self.anchor = 0
            Self.head = 0
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            let elementRightBeforeElement = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation - 1)
            
            element.caretLocation = elementRightBeforeElement!.start
            element.selectedLength = elementRightBeforeElement!.end - elementRightBeforeElement!.start  
            
            Self.anchor = element.caretLocation 
            Self.head = element.caretLocation + element.selectedLength
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
            
            return element
        }
        
        
        if Self.anchor == nil || VimEngine.shared.visualStyle == .characterwise {
            Self.anchor = element.currentLine.start
            Self.head = element.currentLine.end
            
            element.caretLocation = Self.anchor
            element.selectedLength = Self.head - Self.anchor
        } else {
            if Self.head > element.currentLine.endLimit {
                element.caretLocation = element.currentLine.endLimit
            } else {
                element.caretLocation = Self.head                
            }
        }
        
        return element        
    }
    
}
