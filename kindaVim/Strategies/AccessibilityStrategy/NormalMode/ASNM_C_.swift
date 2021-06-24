extension AccessibilityStrategy {
    
    func C(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        element.selectedLength = (element.currentLine.endLimit! + 1) - element.caretLocation
        element.selectedText = ""
                
        return element
    }
    
}
