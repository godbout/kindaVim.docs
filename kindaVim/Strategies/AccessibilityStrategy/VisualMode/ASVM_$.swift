extension AccessibilityStrategyVisualMode {
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
            
        if VimEngine.shared.visualStyle == .characterwise {
            if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
                element.caretLocation = Self.anchor
                element.selectedLength = lineAtHead.end - element.caretLocation
            }
        }
        
        return element
    }
    
}
