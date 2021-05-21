@testable import kindaVim
import XCTest

class AS_h_Tests: AS_BaseTests {}

// TextFields
extension AS_h_Tests {

    func test_that_in_normal_setting_h_goes_one_character_to_the_left_in_TextFields() {
        let element = AccessibilityTextElement(
            internalText: "h goes one character to the left",
            caretLocation: 16,
            lineStart: 0
        )
        
        let returnedElement = accessibilityStrategy.h(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 15)
    }

    func test_that_at_the_beginning_of_a_line_h_does_not_move_in_TextFields() {
        let element = AccessibilityTextElement(
            internalText: "if at the beginning of a line h should not move the caret",
            caretLocation: 0,
            lineStart: 0
        )

        let returnedElement = accessibilityStrategy.h(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }

}

// TextAreas
extension AS_h_Tests {

    func test_that_in_normal_setting_h_goes_one_character_to_the_left_in_TextAreas() {
        let element = AccessibilityTextElement(
            internalText: """
h goes one
character to the
left even
in multilines
""",
            caretLocation: 16,
            lineStart: 11
        )

        let returnedElement = accessibilityStrategy.h(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 15)
    }

    func test_that_at_the_beginning_of_a_line_h_does_not_move_up_to_the_prevous_line_in_TextAreas() {
        let element = AccessibilityTextElement(
            internalText: """
in multiline if
at the beginning of a line
h should not go up to
the previous line
""",
            caretLocation: 43,
            lineStart: 43
        )

        let returnedElement = accessibilityStrategy.h(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 43)
    }

}
