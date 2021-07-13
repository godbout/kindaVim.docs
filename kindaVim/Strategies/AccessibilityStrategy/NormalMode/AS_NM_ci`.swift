extension AccessibilityStrategyNormalMode {
    
    func ciBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return ciInnerQuotedString(using: "`", on: element)
    }
    
}
