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

        
        if Self.anchor == element.caretLocation {
            Self.anchor = Self.head
            Self.head = element.caretLocation
        } else {
            Self.head = Self.anchor
            Self.anchor = element.caretLocation
        }
        
        return element
    }
    
}
