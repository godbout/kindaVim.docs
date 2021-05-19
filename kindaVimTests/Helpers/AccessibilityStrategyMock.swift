@testable import kindaVim
import Foundation

class AccessibilityStrategyMock: AccessibilityStrategyProtocol {
    
    var functionCalled = ""

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

}
