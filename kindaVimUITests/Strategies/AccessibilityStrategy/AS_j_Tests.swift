@testable import kindaVim
import XCTest

class AS_j_Tests: AS_BaseTests {}

// TextFields
extension AS_j_Tests {

    func test_that_for_TextFields_j_returns_nil_coz_we_want_the_KS_to_take_over() {
        let textInAXFocusedElement = "j on a TextField shouldn't use the AS! think Alfred"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        let accessibilityElement = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertNil(accessibilityElement)
    }

}

// TextViews
extension AS_j_Tests {

    func test_that_in_normal_setting_j_goes_to_the_next_line_at_the_same_column() {
        let textInAXFocusedElement = """
let the fun
begin with the
crazy line and
column shit
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])

        let accessibilityElement = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 15)
    }

    func test_that_if_the_next_line_is_shorter_j_goes_to_the_end_of_line_limit_of_that_next_line() {
        let textInAXFocusedElement = """
a line
but this one is much longer
and this one shorter
let's see
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])

        let accessibilityElement = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 64)
    }
}
