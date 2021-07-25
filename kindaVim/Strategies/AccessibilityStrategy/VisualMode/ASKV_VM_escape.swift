extension AccessibilityStrategyVisualMode {
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if Self.head > lineAtHead.endLimit {
                newElement.caretLocation = lineAtHead.endLimit
            } else {
                newElement.caretLocation = Self.head
            }
        }
        
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
