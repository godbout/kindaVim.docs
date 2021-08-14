extension AccessibilityStrategyNormalMode {
    
    func dj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
    
        if nextLine.isTheLastLine, element.currentLine.isNotTheFirstLine {
            newElement.caretLocation = element.currentLine.start - Character.linefeedCharacterLength
            newElement.selectedLength = element.currentLine.length + nextLine.length + Character.linefeedCharacterLength
        } else {
            newElement.caretLocation = element.currentLine.start
            newElement.selectedLength = element.currentLine.length + nextLine.length
        }
        
        newElement.selectedText = ""
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        guard let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else {
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
                     
        let firstNonBlankWithinLineLimitOfUpdatedElementLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: updatedElement.currentLine.value))
            
        newElement.caretLocation = updatedElement.currentLine.start + firstNonBlankWithinLineLimitOfUpdatedElementLocation
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement        
    }
    
}
