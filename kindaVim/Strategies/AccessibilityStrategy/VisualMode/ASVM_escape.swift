extension AccessibilityStrategyVisualMode {
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        
        if element.isEmpty {
            element.selectedLength = 0
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 0
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            
            return element
        }
        
        
        if Self.head > element.currentLine.endLimit {
            element.caretLocation = element.currentLine.endLimit
        } else {
            element.caretLocation = Self.head
        }
        
        element.selectedLength = 0
        element.selectedText = nil
        
        return element
    }
    
}
