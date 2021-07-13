extension AccessibilityStrategyNormalMode {
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
                
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
            let lineValue = nextLine.value
            let firstNonBlankWithinLineLimitOfNextLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineValue))
            let firstNonBlankWithinLineLimitOfNextLineText = lineValue[..<lineValue.index(lineValue.startIndex, offsetBy: firstNonBlankWithinLineLimitOfNextLineLocation)]
            
            element.caretLocation = element.currentLine.start
            element.selectedLength = element.currentLine.length + firstNonBlankWithinLineLimitOfNextLineLocation
            element.selectedText = String(firstNonBlankWithinLineLimitOfNextLineText)
            
            return element
        }
        
        if let previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1) {
            let firstNonBlankWithinLineLimitOfPreviousLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: previousLine.value))
            
            element.caretLocation = element.currentLine.start - 1
            element.selectedLength = element.currentLine.length + 1
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation -= previousLine.length - firstNonBlankWithinLineLimitOfPreviousLineLocation - 1                
            element.selectedLength = 0
            element.selectedText = ""
            
            return element
        }
        
        element.caretLocation = 0
        element.selectedLength = element.length
        element.selectedText = ""                          
        
        return element
    }
    
}
