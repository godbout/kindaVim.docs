@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {}

// Both
extension AS_l_Tests {
    
    func test_that_in_normal_setting_l_goes_one_character_to_the_right_in_Text_AXUIElement() {
        let text = "l should go one character to the right"
        let element = AccessibilityTextElement(
            axValue: text,
            axCaretLocation: 16,
            axLineStart: 0,
            axLineEnd: text.count
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 17)
    }
    
    func test_that_l_does_not_move_if_Text_AXUIElement_is_empty() {
        let element = AccessibilityTextElement(
            axValue: "",
            axCaretLocation: 0,
            axLineStart: nil,
            axLineEnd: nil
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 0)
    }
    
    func test_that_l_does_not_move_if_caret_is_at_end_of_Text_AXUIElement() {
        let text = """
some multiline
shit again
hehe
"""
        let element = AccessibilityTextElement(
            axValue: text,
            axCaretLocation: 29,
            axLineStart: nil,
            axLineEnd: nil
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 29)
    }

}
