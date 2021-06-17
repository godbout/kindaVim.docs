extension AccessibilityStrategy {
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        let lineText = element.currentLine.value        
        let firstNonBlankLocation = textEngine.firstNonBlank(in: lineText)
        let newCaretLocation = element.currentLine.start! + firstNonBlankLocation
        
        if newCaretLocation >= element.currentLine.endLimit! { 
            element.caretLocation = element.currentLine.endLimit!
        } else {
            element.caretLocation = newCaretLocation
        }         
        
        return element
    }
    
}
