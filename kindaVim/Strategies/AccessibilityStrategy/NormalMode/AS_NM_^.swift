extension AccessibilityStrategyNormalMode {
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = element.currentLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: element.currentLine.value))
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
