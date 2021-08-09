import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerBrackets(using: "(", on: element)
    }
    
}
