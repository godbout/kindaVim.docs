extension AccessibilityStrategyVisualMode {
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        return handleAnchorHeadAndCaretLocation(with: element)
    }
    
    private func handleAnchorHeadAndCaretLocation(with element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if Self.anchor == nil || KindaVimEngine.shared.visualStyle == .characterwise {
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
