import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiRightBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerBrackets(using: "[", on: element)
    }
    
}
