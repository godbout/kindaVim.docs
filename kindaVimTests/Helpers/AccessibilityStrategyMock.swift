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

}
