extension AccessibilityStrategyVisualMode {
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if Self.anchor == element.caretLocation {
            Self.anchor = Self.head
            Self.head = element.caretLocation
        } else {
            Self.head = Self.anchor
            Self.anchor = element.caretLocation
        }
        
        newElement.selectedText = nil
        
        return newElement
    }
     
}
