import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerBrackets(using: "{", on: element)
    }
    
}
