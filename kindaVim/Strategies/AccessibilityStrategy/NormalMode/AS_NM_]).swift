extension AccessibilityStrategyNormalMode {
    
    func rightBracketRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.nextUnmatched(")", after: element.caretLocation, in: element.value)
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
