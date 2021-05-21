@testable import kindaVim
import XCTest

class AS_$_Tests: AS_BaseTests {}

// TextFields
extension AS_$_Tests {

    func test_that_in_normal_setting_$_is_moving_caret_position_to_the_last_character_of_the_line() {
        let element = AccessibilityTextElement(
            axText: "hello world",
            axCaretLocation: 4,
            axLineEnd: 11
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 10)
    }

}

// TextViews
extension AS_$_Tests {

    func test_that_on_a_line_that_ends_with_invisible_linefeed_$_stops_two_places_before() {
        let element = AccessibilityTextElement(
            axText: """
indeed
that is
multiline
""",
            axCaretLocation: 13,
            axLineEnd: 14
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 13)
    }

    func test_that_on_a_line_that_ends_with_a_visible_character_$_stops_one_place_before() {
        let element = AccessibilityTextElement(
            axText: """
indeed
that is
multiline
""",
            axCaretLocation: 23,
            axLineEnd: 24
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 23)
    }

}
