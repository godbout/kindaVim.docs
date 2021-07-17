import XCTest


class ASUI_NM_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let asNormalMode = AccessibilityStrategyNormalMode()
    var asVisualMode = AccessibilityStrategyVisualModeMock()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
        KindaVimEngine.shared.enterInsertMode()
    }
    
}

