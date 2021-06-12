extension AccessibilityStrategy {
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return element }
        
        if element.currentLine.isLastLine || element.currentLine.isOnlyALinefeedCharacter {
            element.selectedLength = 0
            element.selectedText = "\n" 
        } else {
            let lineText = element.currentLine.value         
            let lineCaretLocationIndex = lineText.index(lineText.startIndex, offsetBy: element.caretLocation - element.currentLine.start!)            
            let limitForCopyingTextIndex = lineText.index(lineText.startIndex, offsetBy: element.currentLine.endLimit! - element.currentLine.start! + 1)        
            
            let textFromCaretToLimitForCopyingText = lineText[lineCaretLocationIndex..<limitForCopyingTextIndex]
            
            let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
            let firstNonBlankOfCurrentLineText = lineText[lineText.startIndex..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]      
            
            element.selectedLength = textFromCaretToLimitForCopyingText.count
            element.selectedText = String(textFromCaretToLimitForCopyingText + "\n" + firstNonBlankOfCurrentLineText)                            
        }
        
        return element
    }
    
}
