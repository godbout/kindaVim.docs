extension AccessibilityStrategy {
    
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return nil
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return nil
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return nil 
        }
        
        
        let lineStart = element.currentLine.start!                
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let (startQuotedStringLocation, endQuotedStringLocation) = textEngine.innerQuotedString(using: "\"", startingAt: lineCaretLocation, in: lineText) {
                element.caretLocation = lineStart + (startQuotedStringLocation)
                element.selectedLength = endQuotedStringLocation - (startQuotedStringLocation)
                element.selectedText = ""
                
                return element
        }
        
        return nil
    }
    
}
