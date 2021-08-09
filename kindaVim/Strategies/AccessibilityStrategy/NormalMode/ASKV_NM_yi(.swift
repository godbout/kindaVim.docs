import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerBrackets(using: "(", on: element)
    }
    
}
