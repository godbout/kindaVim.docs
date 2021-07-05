import XCTest


class UIAS_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let asNormalMode = AccessibilityStrategyNormalMode()
    let asVisualMode = AccessibilityStrategyVisualMode()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
        VimEngine.shared.enterInsertMode()
    }
    
}

