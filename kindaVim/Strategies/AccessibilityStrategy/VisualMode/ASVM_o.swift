extension AccessibilityStrategyVisualMode {
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if Self.anchor == element.caretLocation {
            Self.anchor = Self.head
            Self.head = element.caretLocation
        } else {
            Self.head = Self.anchor
            Self.anchor = element.caretLocation
        }
        
        element.selectedText = nil
        
        return element
    }
     
}
