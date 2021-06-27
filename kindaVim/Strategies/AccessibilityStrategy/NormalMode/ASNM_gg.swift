extension AccessibilityStrategyNormalMode {
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        
        let firstLine = textEngine.firstLine(in: element.value)
        element.caretLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: firstLine.value))        
        
        return element
    }
    
}
