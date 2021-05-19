@testable import kindaVim
import Foundation

class AccessibilityStrategyMock: AccessibilityStrategyProtocol {
    
    var functionCalled = ""

    func h(on _: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }
    
    func l(on _: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

    func dollarSign(on _: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

    func blockCursor(_: BlockCursorStatus, on: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

}
