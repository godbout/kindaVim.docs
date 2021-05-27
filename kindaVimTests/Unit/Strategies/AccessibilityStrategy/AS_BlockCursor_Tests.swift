@testable import kindaVim
import XCTest

class AS_BlockCursorTests: AS_BaseTests {}

// block cursor ON
extension AS_BlockCursorTests {

    func test_that_in_normal_setting_blockcursor_ON_moves_the_caret_to_the_left_by_one_increment_and_selects_the_next_character() throws {
        throw XCTSkip("block cursor stopped for now due to bug in Big Sur")
        
        let text = "setting block cursor ON"
        let element = AccessibilityTextElement(
            axRole: .textField,
            axValue: text,
            axCaretLocation: 10,
            currentLine: AccessibilityTextElementLine(
                axValue: text,
                number: 0,
                start: 0,
                end: 23
            )
        )

        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 9)
        XCTAssertEqual(returnedElement?.axSelectedLength, 1)
    }

    func test_that_at_the_beginning_of_a_line_blockcursor_ON_does_not_move_and_still_selects_the_next_character() throws {
        throw XCTSkip("block cursor stopped for now due to bug in Big Sur")
        
        let text = """
another
setting block cursor
ON but that is
multiline!
"""
        let element = AccessibilityTextElement(
            axRole: .textArea,
            axValue: text,
            axCaretLocation: 29,
            currentLine: AccessibilityTextElementLine(
                axValue: text,
                number: 2,
                start: 29,
                end: 44
            )
        )
        
        let returnedElement = accessibilityStrategy.blockCursor(.on, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 29)
        XCTAssertEqual(returnedElement?.axSelectedLength, 1)
    }

}

// block cursor OFF
extension AS_BlockCursorTests {

    func test_that_blockcursor_OFF_removes_character_selection_and_does_not_move_the_caret() {
        let text = "let's go block cursor OFF"
        let element = AccessibilityTextElement(
            axRole: .textField,
            axValue: text,
            axCaretLocation: 12,
            currentLine: AccessibilityTextElementLine(
                axValue: text,
                number: 0,
                start: 0,
                end: 25
            )
        )

        let returnedElement = accessibilityStrategy.blockCursor(.off, on: element)

        XCTAssertEqual(returnedElement?.axCaretLocation, 12)
        XCTAssertEqual(returnedElement?.axSelectedLength, 0)
    }

}

