extension AccessibilityStrategyNormalMode {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard element.caretLocation > element.currentLine.start else { 
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.caretLocation -= element.previousCharacterLength
        newElement.selectedLength = element.previousCharacterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
