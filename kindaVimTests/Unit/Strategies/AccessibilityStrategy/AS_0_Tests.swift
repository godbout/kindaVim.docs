@testable import kindaVim
import XCTest

class AS_0_Tests: AS_BaseTests {

    func test_that_in_normal_setting_0_is_moving_the_caret_position_to_the_first_character_of_the_line() {
        let element = AccessibilityTextElement(
            internalText: "0 should send us to the beginning of the line",
            caretLocation: 14,
            lineStart: 0
        )

        let returnedElement = accessibilityStrategy.zero(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }

    func test_that_at_the_beginning_of_a_line_zero_does_not_move() {
        let element = AccessibilityTextElement(
            internalText: """
            multiline
            where we gonna test 0
            """,
            caretLocation: 10,
            lineStart: 10
        )

        let returnedElement = accessibilityStrategy.zero(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 10)
    }

}
