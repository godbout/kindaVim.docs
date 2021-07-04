import Foundation


protocol AccessibilityStrategyVisualModeProtocol {
    
    func c(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func d(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
}


struct AccessibilityStrategyVisualMode: AccessibilityStrategyVisualModeProtocol {
    
    var textEngine: TextEngineProtocol = TextEngine()
    
    static var anchor: Int!
    static var head: Int!
    
    static func reset() {
        anchor = nil
        head = nil
    }
    
}
