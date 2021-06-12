import AppKit

extension AccessibilityStrategy {
    
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element 
        }
        
        
        let lineStart = element.currentLine.start!                
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let (startQuotedStringLocation, endQuotedStringLocation) = textEngine.innerQuotedString(using: "\"", startingAt: lineCaretLocation, in: lineText) {
            element.caretLocation = lineStart + startQuotedStringLocation
                
            let startDoubleQuoteIndex = lineText.index(lineText.startIndex, offsetBy: startQuotedStringLocation)
            let endDoubleQuoteIndex = lineText.index(lineText.startIndex, offsetBy: endQuotedStringLocation)
                
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(lineText[startDoubleQuoteIndex..<endDoubleQuoteIndex]), forType: .string)                
        }        
                
        return element
    }
    
}
