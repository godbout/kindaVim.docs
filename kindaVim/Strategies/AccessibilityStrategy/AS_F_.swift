extension AccessibilityStrategy {
    
    func F(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        if let characterFoundLocation = textEngine.findPrevious(character, before: lineCaretLocation, in: lineText) {
            element.caretLocation = element.currentLine.start! + characterFoundLocation            
        }
        
        return element
    }
    
}
