@testable import kindaVim
import XCTest

class AS_$_Tests: AS_BaseTests {}

// Both
extension AS_$_Tests {
    
    func test_that_if_line_ends_with_visible_character_$_goes_one_character_before_the_end() {
        let text = "hello world"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 4,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 11
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 10)
    }
    
    func test_that_it_does_not_drop_the_block_cursor() {
        let text = "checking the block cursor status when calling that shit move!"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 12
            )
        )
        
        let returnedElement = accessibilityStrategy.dollarSign(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 1)
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
            role: .textArea,
            value: text,
            caretLocation: 13,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 7,
                end: 15
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 13)
    }
    
    func test_that_if_a_line_is_empty_$_does_not_go_up_to_the_end_of_the_previous_line() {
        let text = """
$ shouldn't
go up one else

it's a bug!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 27,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 27,
                end: 28
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 27)
    }

    func test_that_if_the_caret_is_at_the_last_position_of_the_TextView_$_goes_back_one_character() {
        let text = """
some more text
my friend
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 24,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 23)
    }

    func test_that_if_the_caret_is_on_the_last_empty_line_of_the_TextView_$_does_not_go_up_to_the_end_of_the_previous_line() {
        let text = """
$ should not go
up a line when
caret is on empty last
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 59,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        let returnedElement = accessibilityStrategy.dollarSign(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 59)
    }

}
