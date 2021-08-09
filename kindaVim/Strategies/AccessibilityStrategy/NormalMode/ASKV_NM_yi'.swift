import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerQuotedString(using: "'", on: element)
    }
    
}
