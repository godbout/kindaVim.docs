@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {}

// Both
extension AS_l_Tests {
    
    func test_that_in_normal_setting_l_goes_one_character_to_the_right_in_Text_AXUIElement() {
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

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 17)
    }
    
    func test_that_l_does_not_move_if_Text_AXUIElement_is_empty() {
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
        
        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_l_does_not_move_if_caret_is_at_end_limit_of_Text_AXUIElement() {
        let text = """
some multiline
shit again
hehe
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 29,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 26,
                end: 30
            )
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 29)
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
        
        let returnedElement = accessibilityStrategy.l(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }

}
