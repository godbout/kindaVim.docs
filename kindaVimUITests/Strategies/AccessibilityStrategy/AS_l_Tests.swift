import XCTest

class AS_l_Tests: AS_BaseTests {}

// TextFields
extension AS_l_Tests {

    func test_that_in_normal_setting_l_goes_one_character_to_the_right_in_TextFields() {
        let textInAXFocusedElement = "l should go one character to the right"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        let returnedElement = accessibilityStrategy.l(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 34)
    }

    func test_that_at_the_end_of_a_line_l_does_not_move_in_TextFields() {
        let textInAXFocusedElement = "at the end of a line l shouldn't move (or crash)"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let returnedElement = accessibilityStrategy.l(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 48)
    }

}

// TextAreas
extension AS_l_Tests {

    func test_that_on_a_line_that_ends_with_invisible_linefeed_l_stops_two_places_before() {
        let textInAXFocusedElement = """
        on
        a line that ends with invisible
        linefeed
        l stops two places before
        the end
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        let returnedElement = accessibilityStrategy.l(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 1)
    }

    func test_that_on_a_line_that_ends_with_a_visible_character_l_stops_one_place_before() {
        let textInAXFocusedElement = """
        on the last line
        l should stop correctly
        by not counting a linefeed
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])

        let returnedElement = accessibilityStrategy.l(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(returnedElement?.caretLocation, 66)
    }

}


