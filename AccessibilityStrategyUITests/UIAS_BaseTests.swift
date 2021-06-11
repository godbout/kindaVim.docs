import XCTest


class UIAS_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let accessibilityStrategy = AccessibilityStrategy()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }
    
    func applyMoveAndGetBackUpdatedElement(_ move: (AccessibilityTextElement?) -> AccessibilityTextElement?) -> AccessibilityTextElement? {
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        guard let transformedElement = move(accessibilityElement) else { return nil }
        
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: transformedElement)
        
        return  AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }

}
