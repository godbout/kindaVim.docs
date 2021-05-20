@testable import kindaVim
import XCTest

class AS_0_Tests: AS_BaseTests {}

// TextFields
extension AS_0_Tests {

    func test_that_in_normal_setting_0_is_moving_the_caret_position_to_the_first_character_of_the_line() {
        let textInAXFocusedElement = "0 should send us to the beginning of the line"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let returnedElement = accessibilityStrategy.zero(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }

}

// TextViews
extension AS_0_Tests {

    func test_that_at_the_beginning_of_a_line_zero_does_not_move() {
        let textInAXFocusedElement = """
        multiline
        where we gonna test 0
        """

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])

        let returnedElement = accessibilityStrategy.zero(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())


        XCTAssertEqual(returnedElement?.caretLocation, 10)
    }

}
