extension AccessibilityStrategyNormalMode {
    
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineStart = element.currentLine.start    
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findPrevious(character, before: lineCaretLocation, in: lineText) {
            element.caretLocation = lineStart + characterFoundLocation + 1
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
