extension AccessibilityStrategyNormalMode {
    
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        newElement.caretLocation = element.currentLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: element.currentLine.value))
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
