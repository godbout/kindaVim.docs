import XCTest

class AS_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let accessibilityStrategy = AccessibilityStrategy()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

}
