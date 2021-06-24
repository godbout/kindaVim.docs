extension AccessibilityStrategyVisualMode {
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        element.caretLocation = element.currentLine.start!
        element.selectedLength = element.currentLine.length!
        
        return element
    }
    
}
