@testable import kindaVim
import XCTest

class AS_BlockCursorTests: AS_BaseTests {}

// block cursor ON
extension AS_BlockCursorTests {

    func test_that_in_normal_setting_blockcursor_ON_moves_the_caret_to_the_left_by_one_increment_and_selects_the_next_character() {
        let element = AccessibilityTextElement(
            internalText: "setting block cursor ON",
            caretLocation: 4,
            selectedLength: 0
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 3)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
    }

    func test_that_at_the_beginning_of_a_line_blockcursor_ON_does_not_move_and_still_selects_the_next_character() {
        let element = AccessibilityTextElement(
            internalText: """
            another
            setting block cursor
            ON but that is
            multiline!
            """,
            caretLocation: 7,
            lineStart: 7,
            selectedLength: 0
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 7)
        XCTAssertEqual(returnedElement?.selectedLength, 1)

    }

}

// block cursor OFF
extension AS_BlockCursorTests {

    func test_that_blockcursor_OFF_removes_character_selection_and_does_not_move_the_caret() {
        let element = AccessibilityTextElement(
            internalText: "let's go block cursor OFF",
            caretLocation: 4,
            selectedLength: 1
        )

        let returnedElement = accessibilityStrategy.blockCursor(.off, on: element)

        XCTAssertEqual(returnedElement?.internalText, element.internalText)
        XCTAssertEqual(returnedElement?.caretLocation, 4)
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }

}
