extension AccessibilityStrategy {
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        element.caretLocation = element.currentLine.endLimit!
        
        return element
    }
    
}
