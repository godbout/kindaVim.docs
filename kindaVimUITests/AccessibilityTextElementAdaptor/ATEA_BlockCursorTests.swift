@testable import kindaVim
import XCTest

class ATEA_BlockCursorTests: ATEA_BaseTests {

    func test_that_it_returns_an_ax_selected_length_of_1_if_we_send_0() throws {
        throw XCTSkip("block cursor stopped for now due to bug in Big Sur")

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

}
