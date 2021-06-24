extension AccessibilityStrategy {
    
    func ciBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerQuotedString(using: "`", on: element)
    }
    
}
