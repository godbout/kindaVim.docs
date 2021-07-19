extension AccessibilityStrategyNormalMode {
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element            
        }
        
        guard element.caretIsNotAtTheEnd && element.currentLine.isNotAnEmptyLine else {
            element.selectedLength = 0
            element.selectedText = "\n"
            
            return element
        }
                        
        let lineText = element.currentLine.value         
        let lineCaretLocationIndex = lineText.index(lineText.startIndex, offsetBy: element.caretLocation - element.currentLine.start)            
        let limitForCopyingTextIndex = lineText.index(lineText.startIndex, offsetBy: element.currentLine.endLimit - element.currentLine.start + 1)        
        
        let textFromCaretToLimitForCopyingText = lineText[lineCaretLocationIndex..<limitForCopyingTextIndex]
        
        let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
        let firstNonBlankOfCurrentLineText = lineText[..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]      
        
        element.selectedLength = textFromCaretToLimitForCopyingText.count
        element.selectedText = String(textFromCaretToLimitForCopyingText + "\n" + firstNonBlankOfCurrentLineText)                            
        
        return element
    }
    
}