@testable import kindaVim
import Foundation
import AccessibilityStrategy


struct AccessibilityStrategySucceedingMock: AccessibilityStrategyProtocol {

    func focusedTextElement() -> AccessibilityTextElement? {
        return AccessibilityTextElement(
            role: .someOtherShit,
            value: "",
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            selectedText: "",
            currentScreenLine: ScreenLine(
                fullTextValue: "",
                fullTextLength: 0,
                number: 1,
                start: 0,
                end: 0
            )!
        )
    }
    
    func push(element: AccessibilityTextElement) -> Bool {
        return true
    }
    
}