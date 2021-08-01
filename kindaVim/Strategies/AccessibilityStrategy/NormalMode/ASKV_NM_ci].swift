extension AccessibilityStrategyNormalMode {
    
    // see ci)
    func ciRightBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerBrackets(using: "[", on: element)
    }
    
}
