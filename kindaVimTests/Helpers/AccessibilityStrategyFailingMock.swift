@testable import kindaVim
import Foundation
import AccessibilityStrategy


struct AccessibilityStrategyFailingMock: AccessibilityStrategyProtocol {

    func focusedTextElement() -> AccessibilityTextElement? {
        return nil
    }
    
    func push(element: AccessibilityTextElement) -> Bool {
        return false
    }
    
}
