extension AccessibilityStrategyNormalMode {
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = element.currentLine.endLimit
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
