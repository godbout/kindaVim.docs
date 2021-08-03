@testable import kindaVim
import Foundation

struct AccessibilityStrategyMock: AccessibilityStrategyProtocol {

    func focusedTextElement() -> AccessibilityTextElement? {
        return AccessibilityTextElement(value: "", length: 0, caretLocation: 0, selectedLength: 0)
    }
    
    func push(element: AccessibilityTextElement) -> Bool {
        return true
    }
    
}
