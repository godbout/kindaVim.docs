extension AccessibilityStrategyNormalMode {
    
    func x(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard element.currentLine.isNotAnEmptyLine else {
            newElement.selectedLength = 1
            newElement.selectedText = nil
            
            return newElement
        }        
        
        // if we're at the last character of the line we need to move the caret back
        // one position (if not at the start of the line)
        guard element.caretLocation < element.currentLine.endLimit else {
            let characterLengthOfCharacterBeforeLocation = element.characterLengthForCharacter(before: element.caretLocation)
            
            newElement.selectedLength = element.characterLength
            newElement.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
            guard element.caretLocation > element.currentLine.start else {
                newElement.caretLocation = element.currentLine.start
                newElement.selectedLength = newElement.characterLength
                newElement.selectedText = nil
                
                return newElement
            }
            
            newElement.caretLocation -= characterLengthOfCharacterBeforeLocation
            newElement.selectedLength = characterLengthOfCharacterBeforeLocation
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = ""
        
        return newElement
    }
    
}
