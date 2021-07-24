extension AccessibilityStrategyNormalMode {
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard element.caretLocation + element.characterLength <= element.currentLine.endLimit else {
            newElement.caretLocation = element.currentLine.endLimit
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.caretLocation += element.characterLength
        newElement.selectedLength = element.nextCharacterLength        
        newElement.selectedText = nil
        
        return newElement
    }    
    
}
