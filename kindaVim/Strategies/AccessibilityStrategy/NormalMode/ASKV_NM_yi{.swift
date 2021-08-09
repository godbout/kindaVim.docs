import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return yiInnerBrackets(using: "{", on: element)
    }
    
}
