@testable import kindaVim
import XCTest

class ATEA_BlockCursorTests: ATEA_BaseTests {

    func test_that_it_returns_an_ax_selected_length_of_1_if_we_send_0() {
        let text = """
even if we don' select
the Adaptor will select
1 character so that we
fake the block cursor LOL
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(text)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(accessibilityElement?.axSelectedLength, 1)
    }

    func test_that_it_returns_the_selected_length_we_sent_if_we_sent_something_different_than_0() {
        let text = "gonna grab three characters now"

        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(text)
        for _ in 1...3 {
            app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.shift])
        }

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        XCTAssertEqual(accessibilityElement?.axSelectedLength, 3)
    }

}
