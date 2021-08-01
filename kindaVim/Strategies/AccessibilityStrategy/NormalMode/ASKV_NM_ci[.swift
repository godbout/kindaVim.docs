extension AccessibilityStrategyNormalMode {
    
    func ciLeftBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerBrackets(using: "[", on: element)
    }
    
}
