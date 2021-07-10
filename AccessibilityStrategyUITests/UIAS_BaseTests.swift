import XCTest


class UIAS_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let asNormalMode = AccessibilityStrategyNormalMode()
    var asVisualMode: AccessibilityStrategyVisualMode!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
        // new one for every test coz anchor and head are static instance properties
        asVisualMode = AccessibilityStrategyVisualMode()
        VimEngine.shared.enterInsertMode()
    }
    
}

