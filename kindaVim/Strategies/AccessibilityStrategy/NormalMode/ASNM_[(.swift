extension AccessibilityStrategyNormalMode {
    
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        
        element.caretLocation = textEngine.previousUnmatched("(", before: element.caretLocation, in: element.value)
        
        return element
    }
    
}
