@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {}

// TextFields
extension AS_l_Tests {

    func test_that_in_normal_setting_l_goes_one_character_to_the_right_in_TextFields() {
        let element = AccessibilityTextElement(
            axValue: "l should go one character to the right",
            axCaretLocation: 16,
            axLineEnd: 38
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 17)
    }

    func test_that_at_the_end_of_a_line_l_does_not_move_or_crash_in_TextFields() {
        let element = AccessibilityTextElement(
            axValue: "at the end of a line l shouldn't move (or crash)",
            axCaretLocation: 48,
            axLineEnd: 48
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 48)
    }

    func test_that_l_stops_one_character_before_the_last_one_in_TextFields() {
        let element = AccessibilityTextElement(
            axValue: "shouldn't be 0 before or 2 before but 1",
            axCaretLocation: 38,
            axLineEnd: 39
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 38)
    }

    func test_to_make_sure_it_does_not_stop_two_characters_before_the_end() {
        let element = AccessibilityTextElement(
            axValue: "shouldn't be 0 before or 2 before but 1",
            axCaretLocation: 37,
            axLineEnd: 39
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 38)
    }

}

// TextAreas
extension AS_l_Tests {

    func test_that_on_a_line_that_ends_with_invisible_linefeed_l_stops_two_places_before() {
        let element = AccessibilityTextElement(
            axValue: """
on
a line that ends with invisible
linefeed
l stops two places before
the end
""",
            axCaretLocation: 1,
            axLineEnd: 2
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 1)
    }

    func test_that_on_a_line_that_ends_with_a_visible_character_l_stops_one_place_before() {
        let element = AccessibilityTextElement(
            axValue: """
on the last line
l should stop correctly
by not counting a linefeed
""",
            axCaretLocation: 66,
            axLineEnd: 67
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 66)
    }

}
