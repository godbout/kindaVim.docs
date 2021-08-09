import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerQuotedString(using: "`", on: element)
    }
    
}
