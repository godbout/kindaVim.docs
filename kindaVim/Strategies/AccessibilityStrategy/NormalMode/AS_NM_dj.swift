extension AccessibilityStrategyNormalMode {
    
    func dj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
            element.caretLocation = element.currentLine.start
            element.selectedLength = element.currentLine.length + nextLine.length
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            if let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() {            
                let firstNonBlankWithinLineLimitOfUpdatedElementLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: updatedElement.currentLine.value))
                
                element.caretLocation += firstNonBlankWithinLineLimitOfUpdatedElementLocation
            }
            
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }    

        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
