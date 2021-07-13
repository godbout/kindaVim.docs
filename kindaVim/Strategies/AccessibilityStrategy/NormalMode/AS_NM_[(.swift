extension AccessibilityStrategyNormalMode {
    
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.previousUnmatched("(", before: element.caretLocation, in: element.value)
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
