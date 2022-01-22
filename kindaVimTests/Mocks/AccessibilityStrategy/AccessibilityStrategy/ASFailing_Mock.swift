@testable import kindaVim
import Foundation
import AccessibilityStrategy
import Common


struct AccessibilityStrategyFailingMock: AccessibilityStrategyProtocol {

    func focusedTextElement(appFamily: AppFamily = .auto) -> AccessibilityTextElement? {
        return nil
    }
    
    func push(element: AccessibilityTextElement) -> Bool {
        return false
    }
    
}
