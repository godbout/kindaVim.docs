import Foundation


protocol AccessibilityStrategyVisualModeProtocol {
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?

}


struct AccessibilityStrategyVisualMode: AccessibilityStrategyVisualModeProtocol {
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return element
    }
    
}
