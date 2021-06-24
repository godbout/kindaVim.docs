import Foundation


protocol AccessibilityStrategyVisualModeProtocol {
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?

}


struct AccessibilityStrategyVisualMode: AccessibilityStrategyVisualModeProtocol {}
