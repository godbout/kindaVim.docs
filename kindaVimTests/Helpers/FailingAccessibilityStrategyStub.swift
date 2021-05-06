@testable import kindaVim
import Foundation

struct FailingAccessibilityStrategyStub: AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityElement?) -> AccessibilityElement? {
        return nil
    }
    
    func l(on element: AccessibilityElement?) -> AccessibilityElement? {
        return nil        
    }
    
}
