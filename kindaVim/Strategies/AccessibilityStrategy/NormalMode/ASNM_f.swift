extension AccessibilityStrategyNormalMode {
    
    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineStart = element.currentLine.start
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findNext(character, after: lineCaretLocation, in: lineText) {
            element.caretLocation = element.currentLine.start + characterFoundLocation            
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
