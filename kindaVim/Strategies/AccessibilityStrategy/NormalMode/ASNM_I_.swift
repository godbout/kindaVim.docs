extension AccessibilityStrategyNormalMode {
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = element.currentLine.start + textEngine.firstNonBlank(in: element.currentLine.value)
        element.selectedLength = 0
        element.selectedText = nil
        
        return element
        
    }
    
}
