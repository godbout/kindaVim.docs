@testable import kindaVim
import XCTest

class AS_$_Tests: AS_BaseTests {}

// TextFields
extension AS_$_Tests {

    func test_that_in_normal_setting_$_is_moving_caret_position_to_the_last_character_of_the_line() {
        let textInAXFocusedElement = "hello world"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        let returnedElement = accessibilityStrategy.dollarSign(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 10)
    }

}

// TextViews
extension AS_$_Tests {

    func test_that_on_a_line_that_ends_with_invisible_linefeed_$_stops_two_places_before() {
        let textInAXFocusedElement = """
        indeed
        that is
        multiline
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let returnedElement = accessibilityStrategy.dollarSign(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 13)
    }

    func test_that_on_a_line_that_ends_with_a_visible_character_$_stops_one_place_before() {
        let textInAXFocusedElement = """
        indeed
        that is
        multiline
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let returnedElement = accessibilityStrategy.dollarSign(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 23)
    }

}
