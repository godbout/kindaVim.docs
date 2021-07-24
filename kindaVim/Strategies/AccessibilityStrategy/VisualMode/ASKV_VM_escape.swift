extension AccessibilityStrategyVisualMode {
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if Self.head > lineAtHead.endLimit {
                element.caretLocation = lineAtHead.endLimit
            } else {
                element.caretLocation = Self.head
            }
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
