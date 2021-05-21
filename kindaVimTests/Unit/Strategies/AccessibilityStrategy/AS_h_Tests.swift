@testable import kindaVim
import XCTest

class AS_BlockCursorTests: AS_BaseTests {}

// block cursor ON
extension AS_BlockCursorTests {

    func test_that_in_normal_setting_blockcursor_ON_moves_the_caret_to_the_left_by_one_increment_and_selects_the_next_character() {
        let element = AccessibilityTextElement(
            internalText: "setting block cursor ON",
            caretLocation: 10,
            lineStart: 0
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 9)
    }

    func test_that_at_the_beginning_of_a_line_blockcursor_ON_does_not_move_and_still_selects_the_next_character() {
        let element = AccessibilityTextElement(
            internalText: """
another
setting block cursor
ON but that is
multiline!
""",
            caretLocation: 29,
            lineStart: 29
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 29)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }

}

// block cursor OFF
extension AS_BlockCursorTests {

    func test_that_blockcursor_OFF_removes_character_selection_and_does_not_move_the_caret() {
        let element = AccessibilityTextElement(
            internalText: "let's go block cursor OFF",
            caretLocation: 12,
            lineStart: 0
        )
            
        let returnedElement = accessibilityStrategy.blockCursor(.off, on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }

}

