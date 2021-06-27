extension AccessibilityStrategyNormalMode {
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        let lastLine = textEngine.lastLine(in: element.value)
        element.caretLocation = lastLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lastLine.value))
        
        return element
    }
    
}
