import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let lineStart = element.currentLine.start              
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let quotedStringRange = textEngine.innerQuotedString(using: "\"", startingAt: lineCaretLocation, in: lineText) {
            let startDoubleQuoteIndex = lineText.utf16.index(lineText.startIndex, offsetBy: quotedStringRange.lowerBound)
            let endDoubleQuoteIndex = lineText.utf16.index(lineText.startIndex, offsetBy: quotedStringRange.upperBound)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(lineText[startDoubleQuoteIndex..<endDoubleQuoteIndex]), forType: .string)                
            
            newElement.caretLocation = lineStart + quotedStringRange.lowerBound
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }        
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
