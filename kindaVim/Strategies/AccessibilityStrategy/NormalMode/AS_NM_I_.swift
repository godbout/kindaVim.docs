extension AccessibilityStrategyNormalMode {
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        newElement.caretLocation = element.currentLine.start + textEngine.firstNonBlank(in: element.currentLine.value)
        newElement.selectedLength = 0
        newElement.selectedText = nil
        
        return newElement
    }
    
}
