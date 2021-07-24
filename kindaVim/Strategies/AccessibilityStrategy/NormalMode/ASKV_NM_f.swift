extension AccessibilityStrategyNormalMode {
    
    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
       
        let lineStart = element.currentLine.start
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findNext(character, after: lineCaretLocation, in: TextEngineLine(from: lineText)) {
            newElement.caretLocation = element.currentLine.start + characterFoundLocation
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
