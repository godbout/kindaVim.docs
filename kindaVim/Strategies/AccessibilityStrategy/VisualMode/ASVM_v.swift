extension AccessibilityStrategyVisualMode {
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if Self.anchor == nil {
            if element.caretLocation >= element.currentLine.endLimit {
                element.caretLocation = element.currentLine.endLimit
                Self.anchor = element.currentLine.endLimit
                Self.head = element.currentLine.endLimit
            } else {
                Self.anchor = element.caretLocation
                Self.head = element.caretLocation
            }            
        } else if VimEngine.shared.visualStyle == .linewise {
            if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) { 
                if Self.head > lineAtHead.endLimit {
                    element.caretLocation = lineAtHead.endLimit
                } else {
                    element.caretLocation = Self.head
                }
                
                Self.anchor = element.caretLocation
                Self.head = element.caretLocation
            }
        } else if VimEngine.shared.visualStyle == .characterwise {
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
