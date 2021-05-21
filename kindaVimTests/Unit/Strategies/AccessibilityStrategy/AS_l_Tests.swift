@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {}

// TextFields
extension AS_l_Tests {

    func test_that_in_normal_setting_l_goes_one_character_to_the_right_in_TextFields() {
        let element = AccessibilityTextElement(
            internalText: "l should go one character to the right",
            caretLocation: 16,
            lineEnd: 38
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 17)
    }

    func test_that_at_the_end_of_a_line_l_does_not_move_or_crash_in_TextFields() {
        let element = AccessibilityTextElement(
            internalText: "at the end of a line l shouldn't move (or crash)",
            caretLocation: 48,
            lineEnd: 48
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 48)
    }

}

// TextAreas
extension AS_l_Tests {

    func test_that_on_a_line_that_ends_with_invisible_linefeed_l_stops_two_places_before() {
        let element = AccessibilityTextElement(
            internalText: """
on
a line that ends with invisible
linefeed
l stops two places before
the end
""",
            caretLocation: 1,
            lineEnd: 2
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 1)
    }

    func test_that_on_a_line_that_ends_with_a_visible_character_l_stops_one_place_before() {
        let element = AccessibilityTextElement(
            internalText: """
on the last line
l should stop correctly
by not counting a linefeed
""",
            caretLocation: 66,
            lineEnd: 67
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 66)
    }

}
