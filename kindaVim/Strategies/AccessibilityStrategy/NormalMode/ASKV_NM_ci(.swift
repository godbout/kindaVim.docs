extension AccessibilityStrategyNormalMode {
    
    func ciLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerBrackets(using: "(", on: element)
    }
    
}
