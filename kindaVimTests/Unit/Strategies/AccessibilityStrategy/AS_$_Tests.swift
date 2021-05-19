@testable import kindaVim
import XCTest

class AS_$_Tests: AS_BaseTests {

    func test_that_in_normal_setting_$_is_moving_caret_position_to_the_last_character_of_the_line() {
        let element = AccessibilityTextElement(
            internalText: "hello world",
            caretLocation: 6,
            lineEnd: 11
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 10)
    }

    func test_that_on_a_line_that_ends_with_invisible_linefeed_$_stops_two_places_before() {
        let element = AccessibilityTextElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 13,
            lineEnd: 15
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 13)
    }

    func test_that_on_a_line_that_ends_with_a_visible_character_$_stops_one_place_before() {
        let element = AccessibilityTextElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 23,
            lineEnd: 24
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 23)
    }

}
