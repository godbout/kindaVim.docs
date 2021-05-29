@testable import kindaVim
import XCTest

class AS_a_Tests: AS_BaseTests {}

// Both
extension AS_a_Tests {

    func test_that_in_normal_setting_a_goes_one_character_to_the_right_in_Text_AXUIElement() {
        let text = "l should go one character to the right"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 16,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 38
            )
        )

        let returnedElement = accessibilityStrategy.a(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 17)
    }

    func test_that_a_does_not_move_if_Text_AXUIElement_is_empty() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        let returnedElement = accessibilityStrategy.a(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }

}

// TextViews
extension AS_a_Tests {

    func test_that_a_does_not_move_if_caret_is_on_an_empty_line() {
        let text = """
on an empty line

a should not move
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 17,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 17,
                end: 18
            )
        )

        let returnedElement = accessibilityStrategy.a(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 17)
    }

}
