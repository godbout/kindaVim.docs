extension AccessibilityStrategyVisualMode {
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        if Self.anchor == nil || KindaVimEngine.shared.visualStyle == .characterwise {
            Self.anchor = element.currentLine.start
            Self.head = element.currentLine.end
            
            newElement.caretLocation = Self.anchor
            newElement.selectedLength = Self.head - Self.anchor
        } else {
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
