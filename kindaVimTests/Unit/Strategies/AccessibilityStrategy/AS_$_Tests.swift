@testable import kindaVim
import XCTest

class AS_$_Tests: AS_BaseTests {}

// Both
extension AS_$_Tests {
    
    func test_that_if_line_ends_with_visible_character_$_goes_one_character_before_the_end() {
        let text = "hello world"
        let element = AccessibilityTextElement(
            axRole: .textField,
            axValue: text,
            axCaretLocation: 4,
            currentLine: AccessibilityTextElementLine(
                number: 0,
                start: 0,
                end: 11
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 10)
    }

}
    
// TextViews
extension AS_$_Tests {
    
    func test_that_if_line_ends_with_linefeed_$_goes_two_characters_before_the_end() {
        let text = """
indeed
that is
multiline
"""
        let element = AccessibilityTextElement(
            axRole: .textArea,
            axValue: text,
            axCaretLocation: 13,
            currentLine: AccessibilityTextElementLine(
                number: 1,
                start: 7,
                end: 15
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 13)
    }
    
    func test_that_if_caret_is_on_last_empty_line_$_does_not_go_to_end_of_previous_line() {
        let text = """
$ shouldn't
go up one else

it's a bug!
"""
        let element = AccessibilityTextElement(
            axRole: .textArea,
            axValue: text,
            axCaretLocation: 27,
            currentLine: AccessibilityTextElementLine(
                number: 2,
                start: 27,
                end: 28
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 27)
    }

    func test_that_if_a_line_is_empty_$_does_not_go_up_to_the_end_of_the_previous_line() {

    }

}
