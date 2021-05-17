@testable import kindaVim
import XCTest

class AS_l_Tests: AS_BaseTests {
    
    func test_that_in_normal_setting_l_is_moving_cursor_position_to_the_right_by_one_increment() {
        let element = AccessibilityElement(
            internalText: "hello world",
            caretLocation: 6
        )
        
        let returnedElement = accessibilityStrategy.l(on: element)
        
        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 7)
    }

    func test_that_l_does_not_move_further_and_caret_position_is_correct_when_line_ends_with_visible_character() {
        let element = AccessibilityElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 23
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 23)
    }

    func test_that_l_does_not_move_further_and_caret_position_is_correct_when_line_ends_with_invisible_linefeed() {
        let element = AccessibilityElement(
            internalText: """
            indeed
            that is
            multiline
            """,
            caretLocation: 13
        )

        let returnedElement = accessibilityStrategy.l(on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 13)
    }

}
