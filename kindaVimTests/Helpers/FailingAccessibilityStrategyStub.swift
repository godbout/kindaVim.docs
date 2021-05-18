@testable import kindaVim
import Foundation

struct FailingAccessibilityStrategyStub: AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
}
