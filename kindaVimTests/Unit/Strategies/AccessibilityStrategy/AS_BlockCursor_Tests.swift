@testable import kindaVim
import XCTest

class AS_BlockCursorTests: AS_BaseTests {}

// block cursor ON
extension AS_BlockCursorTests {

    func test_that_in_normal_setting_blockcursor_ON_moves_the_caret_to_the_left_by_one_increment_and_selects_the_next_character() {
        let element = AccessibilityTextElement(
            axText: "setting block cursor ON",
            axCaretLocation: 10,
            axLineStart: 0
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 9)
    }

    func test_that_at_the_beginning_of_a_line_blockcursor_ON_does_not_move() {
        let element = AccessibilityTextElement(
            axText: """
another
setting block cursor
ON but that is
multiline!
""",
            axCaretLocation: 29,
            axLineStart: 29
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 29)
    }

}

// block cursor OFF
extension AS_BlockCursorTests {

    func test_that_blockcursor_OFF_does_not_move_the_caret() {
        let element = AccessibilityTextElement(
            axText: "let's go block cursor OFF",
            axCaretLocation: 12,
            axLineStart: 0
        )

        let returnedElement = accessibilityStrategy.blockCursor(.off, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 12)
    }

}

