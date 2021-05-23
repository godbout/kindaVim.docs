@testable import kindaVim
import XCTest

class AS_$_Tests: AS_BaseTests {}

// Both
extension AS_$_Tests {
    
    func test_that_if_line_ends_with_visible_character_$_goes_one_character_before_the_end() {
        let text = "hello world"
        let element = AccessibilityTextElement(
            axValue: text,
            axCaretLocation: 4,
            axLineStart: 0,
            axLineEnd: text.count
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
            axValue: text,
            axCaretLocation: 13,
            axLineStart: 7,
            axLineEnd: 14
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 13)
    }
    
    func test_that_if_caret_is_on_last_empty_line_$_does_not_go_to_end_of_previous_line() {
        let text = """
indeed
that is
multiline with
stupid empty last line

"""
        let element = AccessibilityTextElement(
            axValue: text,
            axCaretLocation: 53,
            axLineStart: nil,
            axLineEnd: nil
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 53)
    }

}
