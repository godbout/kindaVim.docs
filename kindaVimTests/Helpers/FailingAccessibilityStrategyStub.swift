@testable import kindaVim
import Foundation

struct FailingAccessibilityStrategyStub: AccessibilityStrategyProtocol {
    
    static func dump(element: AccessibilityTextElement?) {}
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
}
