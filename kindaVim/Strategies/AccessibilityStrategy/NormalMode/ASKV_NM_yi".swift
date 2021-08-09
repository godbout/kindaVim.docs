import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerQuotedString(using: "\"", on: element)
    }
    
}
