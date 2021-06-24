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
        
        let previousLine = textEngine.previousLine(before: element.caretLocation, in: element.value)!
        let lineText = element.currentLine.value
        let lineStart = element.currentLine.start!
        let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
        let firstNonBlankOfCurrentLineText = lineText[..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]
        
        element.caretLocation = lineStart - previousLine.count
        element.selectedLength = previousLine.count - 1
        element.selectedText = previousLine + firstNonBlankOfCurrentLineText
        
        return element         
    }
    
}
