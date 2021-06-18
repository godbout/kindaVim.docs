extension AccessibilityStrategy {
    
    func rightBracketRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        
        element.caretLocation = textEngine.nextUnmatched(")", after: element.caretLocation, in: element.value)
        
        return element
    }
    
}
