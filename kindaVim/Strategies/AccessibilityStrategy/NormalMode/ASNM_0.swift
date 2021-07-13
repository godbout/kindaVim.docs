extension AccessibilityStrategyNormalMode {
    
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = element.currentLine.start
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
