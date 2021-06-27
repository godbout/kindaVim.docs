extension AccessibilityStrategyNormalMode {
    
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return element }
        
        if element.currentLine.isTheFirstLine {
            let lineText = element.currentLine.value
            let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
            let firstNonBlankOfCurrentLineText = lineText[..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]
            
            element.caretLocation = 0
            element.selectedLength = 0
            element.selectedText = "\n"            
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            element.caretLocation = 0
            element.selectedLength = 0
            element.selectedText = String(firstNonBlankOfCurrentLineText)
            
            return element            
        }
        
        if element.currentLine.isTheLastLine {
            element.selectedText = "\n"
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            element.selectedText = ""
            
            return element
        }
        
        if let axPreviousLine = AXEngine.axLineRangeFor(lineNumber: element.currentLine.number! - 1) {
            let value = element.value
            let previousLineText = value[value.index(value.startIndex, offsetBy: axPreviousLine.location)..<value.index(value.startIndex, offsetBy: axPreviousLine.location + axPreviousLine.length)]
            let currentLineText = element.currentLine.value
            let currentLineStart = element.currentLine.start!
            let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: currentLineText)
            let firstNonBlankOfCurrentLineText = currentLineText[..<currentLineText.index(currentLineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]
            
            element.caretLocation = currentLineStart - previousLineText.count
            element.selectedLength = previousLineText.count - 1
            element.selectedText = String(previousLineText) + firstNonBlankOfCurrentLineText
        }
        
        return element         
    }
    
}
