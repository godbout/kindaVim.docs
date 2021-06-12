extension AccessibilityStrategy {
    
    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        guard element.currentLine.isOnlyALinefeedCharacter == false else { return element }
        
        element.caretLocation += 1
        
        return element
    }
    
}
