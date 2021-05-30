import XCTest

class UIAS_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let accessibilityStrategy = AccessibilityStrategy()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

}
