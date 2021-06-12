extension AccessibilityStrategy {
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        
        let firstLine = textEngine.firstLine(in: element.value)
        let characterFoundLocation = textEngine.firstNonBlank(in: firstLine)        
        
        if characterFoundLocation >= firstLine.endLimit { 
            element.caretLocation = firstLine.endLimit
        } else {
            element.caretLocation = characterFoundLocation
        }            
        
        return element
    }
    
}
