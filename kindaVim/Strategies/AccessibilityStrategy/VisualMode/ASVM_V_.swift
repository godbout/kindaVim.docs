extension AccessibilityStrategyVisualMode {
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            Self.anchor = 0
            Self.head = 0
            
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            let elementRightBeforeElement = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation - 1)
            
            element.caretLocation = elementRightBeforeElement!.start
            element.selectedLength = elementRightBeforeElement!.end - elementRightBeforeElement!.start  
            element.selectedText = nil
            
            Self.anchor = element.caretLocation 
            Self.head = element.caretLocation + element.selectedLength
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            Self.anchor = element.caretLocation
            Self.head = element.caretLocation
            
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if Self.anchor == nil || VimEngine.shared.visualStyle == .characterwise {
            Self.anchor = element.currentLine.start
            Self.head = element.currentLine.end
            
            element.caretLocation = Self.anchor
            element.selectedLength = Self.head - Self.anchor
        } else {
            if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) { 
                if Self.head > lineAtHead.endLimit {
                    element.caretLocation = lineAtHead.endLimit
                } else {
                    element.caretLocation = Self.head                
                }
            }
        }
        
        element.selectedText = nil
        
        return element   
    }
    
}
