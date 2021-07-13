import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineStart = element.currentLine.start              
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let quotedStringRange = textEngine.innerQuotedString(using: "\"", startingAt: lineCaretLocation, in: lineText) {
            element.caretLocation = lineStart + quotedStringRange.lowerBound
            
            let startDoubleQuoteIndex = lineText.index(lineText.startIndex, offsetBy: quotedStringRange.lowerBound)
            let endDoubleQuoteIndex = lineText.index(lineText.startIndex, offsetBy: quotedStringRange.upperBound)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(lineText[startDoubleQuoteIndex..<endDoubleQuoteIndex]), forType: .string)                
        }        
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
