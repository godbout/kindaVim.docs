extension AccessibilityStrategyNormalMode {
    
    // yes, calling innerBrackets with "("
    func ciRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerBrackets(using: "(", on: element)
    }
    
}
