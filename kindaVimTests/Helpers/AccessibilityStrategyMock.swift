@testable import kindaVim
import Foundation

class AccessibilityStrategyMock: AccessibilityStrategyProtocol {
    
    var functionCalled = ""

    func h(on _: AccessibilityElement?) -> AccessibilityElement? {
        functionCalled = #function

        return nil
    }
    
    func l(on _: AccessibilityElement?) -> AccessibilityElement? {
        functionCalled = #function

        return nil
    }

}
