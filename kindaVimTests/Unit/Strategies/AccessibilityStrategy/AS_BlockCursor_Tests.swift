@testable import kindaVim
import XCTest

class AS_BlockCursorTests: AS_BaseTests {}

// block cursor ON
extension AS_BlockCursorTests {

    func test_that_in_normal_setting_blockcursor_ON_moves_the_caret_to_the_left_by_one_increment_and_selects_the_next_character() throws {
        throw XCTSkip("block cursor stopped for now due to bug in Big Sur")

        let element = AccessibilityTextElement(
            axValue: "setting block cursor ON",
            axCaretLocation: 10,
            axLineStart: 0
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 9)
        XCTAssertEqual(returnedElement?.axSelectedLength, 1)
    }

    func test_that_at_the_beginning_of_a_line_blockcursor_ON_does_not_move_and_still_selects_the_next_character() throws {
        throw XCTSkip("block cursor stopped for now due to bug in Big Sur")

        let element = AccessibilityTextElement(
            axValue: """
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
        XCTAssertEqual(returnedElement?.axSelectedLength, 1)
    }

}

// block cursor OFF
extension AS_BlockCursorTests {

    func test_that_blockcursor_OFF_removes_character_selection_and_does_not_move_the_caret() {
        let element = AccessibilityTextElement(
            axValue: "let's go block cursor OFF",
            axCaretLocation: 12,
            axLineStart: 0
        )

        let returnedElement = accessibilityStrategy.blockCursor(.off, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 12)
        XCTAssertEqual(returnedElement?.axSelectedLength, 0)
    }

}

