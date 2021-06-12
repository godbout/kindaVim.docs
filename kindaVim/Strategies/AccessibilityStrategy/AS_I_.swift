extension AccessibilityStrategy {
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        let lineText = element.currentLine.value        
        let characterFoundLocation = textEngine.firstNonBlank(in: lineText)        
        
        element.caretLocation = element.currentLine.start! + characterFoundLocation 
        
        return element
    }
    
}
