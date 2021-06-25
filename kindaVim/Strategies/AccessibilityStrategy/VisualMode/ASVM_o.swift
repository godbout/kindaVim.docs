extension AccessibilityStrategyVisualMode {
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {        
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if Self.head == element.caretLocation {
            Self.head = element.caretLocation + element.selectedLength - 1
        } else {
            Self.head = element.caretLocation
        }        
        
        return element
    }
    
}
