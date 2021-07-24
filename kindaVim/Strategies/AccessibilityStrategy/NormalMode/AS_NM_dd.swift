extension AccessibilityStrategyNormalMode {
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
                
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
            let lineValue = nextLine.value
            let firstNonBlankWithinLineLimitOfNextLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineValue))
            let firstNonBlankWithinLineLimitOfNextLineText = lineValue[..<lineValue.utf16.index(lineValue.startIndex, offsetBy: firstNonBlankWithinLineLimitOfNextLineLocation)]
            
            newElement.caretLocation = element.currentLine.start
            newElement.selectedLength = element.currentLine.length + firstNonBlankWithinLineLimitOfNextLineLocation
            newElement.selectedText = String(firstNonBlankWithinLineLimitOfNextLineText)
            
            return newElement
        }
        
        if let previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1) {
            let firstNonBlankWithinLineLimitOfPreviousLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: previousLine.value))
            
            newElement.caretLocation = element.currentLine.start - AccessibilityTextElement.linefeedCharacterLength
            newElement.selectedLength = element.currentLine.length + AccessibilityTextElement.linefeedCharacterLength
            newElement.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
            newElement.caretLocation -= previousLine.lengthWithoutLinefeed - firstNonBlankWithinLineLimitOfPreviousLineLocation                
            newElement.selectedLength = 0
            newElement.selectedText = ""
            
            return newElement
        }
        
        newElement.caretLocation = 0
        newElement.selectedLength = element.length
        newElement.selectedText = ""                          
        
        return newElement
    }
    
}
