import XCTest
import AccessibilityStrategy


class ASUI_BaseTests: XCTestCase {
    
    var app: XCUIApplication!
    
    let accessibilityStrategy = AccessibilityStrategy()
    let asNormalMode = AccessibilityStrategyNormalMode()
    var asVisualMode: AccessibilityStrategyVisualMode!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        AppCore.shared.setUp()
        
        app = XCUIApplication()
        app.launch()
                
        // new one for every test coz anchor and head are static instance properties
        asVisualMode = AccessibilityStrategyVisualMode()
    }
    
    @discardableResult
    func applyMove(_ move: (AccessibilityTextElement?) -> AccessibilityTextElement?) -> AccessibilityTextElement? {
        let focusedElement = accessibilityStrategy.focusedTextElement()
        guard let transformedElement = move(focusedElement) else { return nil }
        _ = accessibilityStrategy.push(element: transformedElement)
        let latestFocusedElement = accessibilityStrategy.focusedTextElement()

        return latestFocusedElement
    }
    
    @discardableResult
    func applyMove(with character: Character, _ move: (Character, AccessibilityTextElement?) -> AccessibilityTextElement?) -> AccessibilityTextElement? {
        let focusedElement = accessibilityStrategy.focusedTextElement()
        guard let transformedElement = move(character, focusedElement) else { return nil }
        _ = accessibilityStrategy.push(element: transformedElement)
        let latestFocusedElement = accessibilityStrategy.focusedTextElement()

        return latestFocusedElement
    }

}
