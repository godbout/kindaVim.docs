import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiLeftBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerBrackets(using: "[", on: element)
    }
    
}
