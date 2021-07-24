extension AccessibilityStrategyVisualMode {
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        if Self.anchor == nil {
            if element.caretLocation >= element.currentLine.endLimit {
                newElement.caretLocation = element.currentLine.endLimit
                Self.anchor = element.currentLine.endLimit
                Self.head = element.currentLine.endLimit
            } else {
                Self.anchor = element.caretLocation
                Self.head = element.caretLocation
            }            
        } else if KindaVimEngine.shared.visualStyle == .linewise {
            if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) { 
                if Self.head > lineAtHead.endLimit {
                    newElement.caretLocation = lineAtHead.endLimit
                } else {
                    newElement.caretLocation = Self.head
                }
                
                Self.anchor = newElement.caretLocation
                Self.head = newElement.caretLocation
            }
        } else if KindaVimEngine.shared.visualStyle == .characterwise {
            if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) { 
                if Self.head > lineAtHead.endLimit {
                    newElement.caretLocation = lineAtHead.endLimit
                } else {
                    newElement.caretLocation = Self.head
                }
            }
        }
        
        newElement.selectedText = nil
        
        return newElement   
    }
    
}
