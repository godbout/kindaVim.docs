extension AccessibilityStrategy {
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard let lineStart = element.currentLine.start else { return element }
        
        if let nextLine = textEngine.nextLine(after: element.caretLocation, in: element.value) {
            let firstNonBlankOfNextLineLocation = textEngine.firstNonBlank(in: nextLine)
            let firstNonBlankOfNextLineText = nextLine[nextLine.startIndex..<nextLine.index(nextLine.startIndex, offsetBy: firstNonBlankOfNextLineLocation)]
            
            element.caretLocation = lineStart
            element.selectedLength = element.currentLine.length! + firstNonBlankOfNextLineText.count
            element.selectedText = String(firstNonBlankOfNextLineText)
        } else {
            if element.currentLine.isTheFirstLine {
                element.caretLocation = 0
                element.selectedLength = element.value.count
                element.selectedText = ""
            } else {
                let previousLine = textEngine.previousLine(before: element.caretLocation, in: element.value)!
                let firstNonBlankOfPreviousLineLocation = textEngine.firstNonBlank(in: previousLine)
                    
                element.caretLocation = lineStart - 1
                element.selectedLength = element.currentLine.length! + 1
                element.selectedText = ""
                
                _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
                
                element.caretLocation -= previousLine.count - firstNonBlankOfPreviousLineLocation - 1
                element.selectedLength = 0
                element.selectedText = ""                
            }
        }        
        
        return element
    }
    
}
