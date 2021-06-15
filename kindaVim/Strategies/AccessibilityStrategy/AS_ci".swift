extension AccessibilityStrategy {
    
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerQuotedString(using: "\"", on: element)
    }
    
}
