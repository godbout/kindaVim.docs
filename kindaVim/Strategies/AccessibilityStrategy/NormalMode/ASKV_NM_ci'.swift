extension AccessibilityStrategyNormalMode {
    
    func ciSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerQuotedString(using: "'", on: element)
    }
    
}
