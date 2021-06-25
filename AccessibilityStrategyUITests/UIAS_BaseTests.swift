import XCTest


class UIAS_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let asNormalMode = AccessibilityStrategyNormalMode()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
        VimEngine.shared.enterNormalMode()
    }
    
    func applyMoveAndGetBackUpdatedElement(_ move: (AccessibilityTextElement?) -> AccessibilityTextElement?) -> AccessibilityTextElement? {
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        guard let transformedElement = move(accessibilityElement) else { return nil }
        
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: transformedElement)
        
        return  AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }

}
