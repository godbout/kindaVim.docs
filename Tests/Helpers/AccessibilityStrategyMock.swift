@testable import kindaVim
import Foundation
import AccessibilityStrategy


struct AccessibilityStrategyMock: AccessibilityStrategyProtocol {

    func focusedTextElement() -> AccessibilityTextElement? {
        return nil
    }
    
    func push(element: AccessibilityTextElement) -> Bool {
        return true
    }
    
}
