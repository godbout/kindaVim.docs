@testable import kindaVim
import XCTest

class AS_0_Tests: AS_BaseTests {}

// TextFields
extension AS_0_Tests {

    func test_that_in_normal_setting_0_is_moving_the_caret_position_to_the_first_character_of_the_line() {
        let element = AccessibilityTextElement(
            axText: "0 should send us to the beginning of the line",
            axCaretLocation: 15,
            axLineStart: 0
        )

        let returnedElement = accessibilityStrategy.zero(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 0)
    }

}

// TextViews
extension AS_0_Tests {

    func test_that_at_the_beginning_of_a_line_zero_does_not_move() {
        
        let element = AccessibilityTextElement(
            axText: """
multiline
where we gonna test 0
""",
            axCaretLocation: 10,
            axLineStart: 10
        )

        let returnedElement = accessibilityStrategy.zero(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 10)
    }

}
