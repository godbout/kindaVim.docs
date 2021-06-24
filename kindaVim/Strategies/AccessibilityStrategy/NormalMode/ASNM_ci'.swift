extension AccessibilityStrategy {
    
    func ciSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerQuotedString(using: "'", on: element)
    }
    
}
