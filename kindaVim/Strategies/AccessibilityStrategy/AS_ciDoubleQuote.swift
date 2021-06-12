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
        
        if let previousDoubleQuoteLocation = textEngine.findPrevious("\"", before: lineCaretLocation, in: lineText) {
            if let nextDoubleQuoteLocation = textEngine.findNext("\"", after: lineCaretLocation - 1, in: lineText) {
                element.caretLocation = lineStart + (previousDoubleQuoteLocation + 1)
                element.selectedLength = nextDoubleQuoteLocation - (previousDoubleQuoteLocation + 1)
                element.selectedText = ""
                
                return element
            }
            
            return nil
        }
        
        if let firstDoubleQuoteLocation = textEngine.findFirst("\"", in: lineText), let secondDoubleQuoteLocation = textEngine.findSecond("\"", in: lineText) {
            element.caretLocation = lineStart + (firstDoubleQuoteLocation + 1)
            element.selectedLength = secondDoubleQuoteLocation - (firstDoubleQuoteLocation + 1)
            element.selectedText = ""
            
            return element
        }
        
        return nil        
    }
    
}
