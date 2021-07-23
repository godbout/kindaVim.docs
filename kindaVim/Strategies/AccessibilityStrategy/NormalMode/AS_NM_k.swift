extension AccessibilityStrategyNormalMode {
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        guard element.role == .textArea else { return nil }        
        var newElement = element
        
        
        if let previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1) {
            guard previousLine.length > AccessibilityTextElement.globalColumnNumber else {
                let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
                
                newElement.caretLocation = previousLine.endLimit
                newElement.selectedLength = newElement.characterLength
                newElement.selectedText = nil
                
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber
                
                return newElement
            }
                
            newElement.caretLocation = previousLine.start + AccessibilityTextElement.globalColumnNumber - 1
            // see k for why the fucking 1 here
            newElement.selectedLength = 1
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
