extension AccessibilityStrategyNormalMode {
    
    func leftBracketLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        newElement.caretLocation = textEngine.previousUnmatched("{", before: element.caretLocation, in: element.value)
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement
    }   
    
}
