extension AccessibilityStrategyNormalMode {
    
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard element.role == .textArea else {
            newElement.selectedLength = 0
            newElement.selectedText = nil
            
            return newElement             
        }
        
        if element.currentLine.isTheFirstLine {
            let lineText = element.currentLine.value
            let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
            let firstNonBlankOfCurrentLineText = lineText[..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]
            
            newElement.caretLocation = 0
            newElement.selectedLength = 0
            newElement.selectedText = "\n"            
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
            newElement.caretLocation = 0
            newElement.selectedLength = 0
            newElement.selectedText = String(firstNonBlankOfCurrentLineText)
            
            return newElement            
        }
        
        if element.currentLine.isTheLastLine, element.lastCharacterIsLinefeed {
            newElement.selectedText = "\n"
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
            newElement.selectedText = ""
            
            return newElement
        }
        
        if let previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1) {
            let currentLineText = element.currentLine.value
            let currentLineStart = element.currentLine.start
            let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: currentLineText)
            let firstNonBlankOfCurrentLineText = currentLineText[..<currentLineText.utf16.index(currentLineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]
            
            newElement.caretLocation = currentLineStart - previousLine.length
            newElement.selectedLength = previousLine.length - 1
            newElement.selectedText = previousLine.value + firstNonBlankOfCurrentLineText
            
            return newElement
        }
        
        newElement.selectedLength = 0
        newElement.selectedText = nil
        
        return newElement         
    }
    
}
