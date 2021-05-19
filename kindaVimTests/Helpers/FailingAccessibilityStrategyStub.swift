@testable import kindaVim
import Foundation

struct FailingAccessibilityStrategyStub: AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }

    func dollarSign(on _: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func blockCursor(_: BlockCursorStatus, on: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
}
