extension AccessibilityStrategyNormalMode {
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard element.role == .textArea else {
            newElement.selectedLength = 0
            newElement.selectedText = nil
            
            return newElement            
        }
        
        guard element.caretIsNotAtTheEnd && element.currentLine.isNotAnEmptyLine else {
            newElement.selectedLength = 0
            newElement.selectedText = "\n"
            
            return newElement
        }
                        
        let lineText = element.currentLine.value         
        let lineCaretLocationIndex = lineText.utf16.index(lineText.startIndex, offsetBy: element.caretLocation - element.currentLine.start)            
        let limitForCopyingTextIndex = lineText.utf16.index(lineText.startIndex, offsetBy: element.currentLine.endLimit - element.currentLine.start)        
        
        let textFromCaretToLimitForCopyingText = lineText[lineCaretLocationIndex...limitForCopyingTextIndex]
        
        let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
        let firstNonBlankOfCurrentLineText = lineText[..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]      
        
        newElement.selectedLength = textFromCaretToLimitForCopyingText.utf16.count
        newElement.selectedText = String(textFromCaretToLimitForCopyingText + "\n" + firstNonBlankOfCurrentLineText)                            
        
        return newElement
    }
    
}
