@testable import kindaVim
import XCTest

class AS_0_Tests: AS_BaseTests {}

// Both
extension AS_0_Tests {

    func test_that_in_normal_setting_0_is_moving_the_caret_position_to_the_first_character_of_the_line() {
        let text = "0 should send us to the beginning of the line"
        let element = AccessibilityTextElement(
            axRole: .textField,
            axValue: text,
            axCaretLocation: 15,
            currentLine: AccessibilityTextElementLine(
                number: 0,
                start: 0,
                end: 45
            )
        )

        let returnedElement = accessibilityStrategy.zero(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 0)
    }

}

// TextViews
extension AS_0_Tests {

    func test_that_at_the_beginning_of_a_line_zero_does_not_move() {
        let text = """
multiline
where we gonna test 0
"""
        let element = AccessibilityTextElement(
            axRole: .textArea,
            axValue: text,
            axCaretLocation: 10,
            currentLine: AccessibilityTextElementLine(
                number: 1,
                start: 10,
                end: 31
            )
        )

        let returnedElement = accessibilityStrategy.zero(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 10)
    }

}
