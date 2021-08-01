extension AccessibilityStrategyNormalMode {
    
    // see ci)
    func ciRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerBrackets(using: "{", on: element)
    }
    
}
