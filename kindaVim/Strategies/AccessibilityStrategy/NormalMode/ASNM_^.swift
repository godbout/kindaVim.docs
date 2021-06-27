extension AccessibilityStrategyNormalMode {
    
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
        element.caretLocation = element.currentLine.start! + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineText))
        
        return element
    }
    
}
