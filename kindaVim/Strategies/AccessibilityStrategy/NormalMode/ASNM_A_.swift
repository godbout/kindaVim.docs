extension AccessibilityStrategyNormalMode {
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        guard element.currentLine.isNotAnEmptyLine else { return element }
        
        element.caretLocation = element.currentLine.endLimit! + 1
        
        return element
    }
    
}
