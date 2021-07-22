extension AccessibilityStrategyNormalMode {
    
    func dj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
            newElement.caretLocation = element.currentLine.start
            newElement.selectedLength = element.currentLine.length + nextLine.length
            newElement.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
            if let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() {            
                let firstNonBlankWithinLineLimitOfUpdatedElementLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: updatedElement.currentLine.value))
                
                newElement.caretLocation += firstNonBlankWithinLineLimitOfUpdatedElementLocation
            }
            
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }    

        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
