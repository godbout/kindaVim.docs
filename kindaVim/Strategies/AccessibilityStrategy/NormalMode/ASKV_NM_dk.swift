extension AccessibilityStrategyNormalMode {
    
    func dk(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard let previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        if element.currentLine.isTheLastLine, previousLine.isNotTheFirstLine {
            newElement.caretLocation = previousLine.start - Character.linefeedCharacterLength
            newElement.selectedLength = previousLine.length + newElement.currentLine.length + Character.linefeedCharacterLength

        } else {
            newElement.caretLocation = previousLine.start
            newElement.selectedLength = previousLine.length + newElement.currentLine.length
        }
        
        newElement.selectedText = ""
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        guard let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else {
            newElement.selectedLength = element.characterLength
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
